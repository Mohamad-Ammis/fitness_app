// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';
import 'package:fitnessapp/models/post_model.dart';
import 'package:fitnessapp/services/api2.dart';
import 'package:fitnessapp/views/media/add_post.dart';
import 'package:fitnessapp/views/media/media_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fitnessapp/constans.dart';
import 'package:fitnessapp/main.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ControllerAddPost extends GetxController {
  bool isLoading = false;

  isLoadingTure() {
    isLoading = true;
    update();
  }

  isLoadingFalse() {
    isLoading = false;
    update();
  }

  TextEditingController textComment = TextEditingController();
  File? imageComment;
  Future getImageComment() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageComment = File(pickedImage.path);
    } else {
      "No pic ";
    }
    update();
  }

  List<PostModel> postsList = [];
  TextEditingController textPost = TextEditingController();

  final picker = ImagePicker();
  List<XFile> images = [];

  Future getImages() async {
    final List<XFile> pickedImages = await picker.pickMultiImage();
    if (pickedImages.isNotEmpty) {
      for (var i = 0; i < pickedImages.length; i++) {
        images.add(pickedImages[i]);
        // print('Added image: ${pickedImages[i].path}');
      }
    } else {
      "No pic ";
    }
    update();
  }

  Future<int> addPostFunchat() async {
    List<File> imagesFiles = images.map((xFile) => File(xFile.path)).toList();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString("token")}'
    };

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constans.baseUrl}post/addpost'));

      request.fields['body'] = textPost.text;

      for (var i = 0; i < imagesFiles.length; i++) {
        var filePath = imagesFiles[i].path;
        print("Adding file: $filePath");

        var multipartFile =
            await http.MultipartFile.fromPath('images[]', filePath);

        request.files.add(multipartFile);
        print("Added file size: ${multipartFile.length} bytes");
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("Successful");
        update();
        return 200;
      } else if (response.statusCode == 500) {
        print("Server error");
        throw "No internet, try again";
      } else if (response.statusCode == 422) {
        print("Bad request");
        Get.snackbar(
          "Sorry you can't share it",
          "Don't be rude! The cultural sports community doesn't accept this kind of word.",
          animationDuration: const Duration(seconds: 2),
          duration: const Duration(seconds: 15),
          backgroundColor: Colors.white,
          backgroundGradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 85, 116, 143),
              Color.fromARGB(255, 75, 113, 168),
              Color.fromARGB(255, 116, 135, 185),
            ],
          ),
        );
        update();
        return 422;
      } else {
        print(response.reasonPhrase);
        print(response.statusCode);
      }
      update();
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PostModel>?> getAllPosts() async {
    try {
      Map<dynamic, dynamic> jsonData = await Api().get(
          url: "${Constans.baseUrl}post/showAllPost",
          token: userInfo?.getString("token"));

      postsList = [];

      for (var i = 0; i < jsonData["posts"].length; i++) {
        postsList.add(PostModel.fromJson(jsonData["posts"], i));
      }

      return postsList;
    } catch (e) {
      Get.snackbar(
        'Error',
        'No Internet. Please try again later.',
      );
    }
    return null;
  }

  Future<void> deletePost(int? postId) async {
    await Api().get(
        url: "${Constans.baseUrl}post/deletePost/$postId",
        token: userInfo?.getString("token"));
  }

  Future<void> likePost(int? postId) async {
    await Api().get(
        url: "${Constans.baseUrl}likePost/$postId",
        token: userInfo?.getString("token"));
    update();
  }

  Future<void> unlikePost(int? postId) async {
    await Api().get(
        url: "${Constans.baseUrl}unlikePost/$postId",
        token: userInfo?.getString("token"));
  }

  Future<List<PostModel>?>? postsFuture;
  FocusNode textFieldFocusNode = FocusNode();

  Future<void> navigateToAddPost() async {
    await Get.to(const AddPost());
    refreshPosts();
  }

  void refreshPosts() {
    postsFuture = getAllPosts();
    update();
  }

  Future<void> navigateToProfile(userId, username, userImage, isImage) async {
    await Get.to(MediaProfile(
        userId: userId,
        username: username,
        userImage: userImage,
        isImage: isImage));
    refreshPosts();
  }

  Map<String, dynamic> responseMap = {};
  CommentModel newComment = CommentModel();

  Future<int> addCommentFun(String postId) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString("token")}'
    };
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constans.baseUrl}comment/addcomment'));

      request.fields['post_id'] = postId;

      if (textComment.text.isNotEmpty) {
        request.fields['body'] = textComment.text;
      }

      if (imageComment != null) {
        request.files.add(
            await http.MultipartFile.fromPath('image', imageComment!.path));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        print("successful");

        final Map<String, dynamic> responseMap =
            jsonDecode(await response.stream.bytesToString());
        newComment = CommentModel.fromJson1(responseMap["comment"]);
        update();
        return 200;
      } else if (response.statusCode == 500) {
        print("NO");
        print(response.statusCode);
        throw " No Intrnet, Try again";
      } else if (response.statusCode == 400) {
        print("400haha");
        Get.snackbar("Sorry you can't share it",
            "Don't be rude ! The cultural sports community doesn't accept this kind of word.",
            animationDuration: const Duration(seconds: 2),
            duration: const Duration(seconds: 15),
            backgroundColor: Colors.white,
            backgroundGradient: const LinearGradient(
              colors: [
                Color.fromARGB(255, 85, 116, 143),
                Color.fromARGB(255, 75, 113, 168),
                Color.fromARGB(255, 116, 135, 185)
              ],
            ));
        update();
        return 400;
      } else {
        print(response.reasonPhrase);
        print(response.statusCode);
      }
      update();
      return response.statusCode;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> likeComment(int? commentId) async {
    await Api().get(
        url: "${Constans.baseUrl}likeComment/$commentId",
        token: userInfo?.getString("token"));
  }

  Future<void> unlikeComment(int? commentId) async {
    await Api().get(
        url: "${Constans.baseUrl}unlikeComment/$commentId",
        token: userInfo?.getString("token"));
  }

  Future<void> deleteComment(int? commentId) async {
    await Api().get(
        url: "${Constans.baseUrl}comment/deletecomment/$commentId",
        token: userInfo?.getString("token"));
  }

  Future<int> addPostFun() async {
    List<File> imagesFiles = images.map((xFile) => File(xFile.path)).toList();

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${userInfo!.getString("token")}'
    };

    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constans.baseUrl}post/addpost'));

      // إضافة النص إلى الطلب
      // request.fields['body'] = textPost.text;

      if (textPost.text.isNotEmpty) {
        request.fields['body'] = textPost.text;
      }

      for (var i = 0; i < imagesFiles.length; i++) {
        var filePath = imagesFiles[i].path;
        print("Adding file: $filePath");

        var multipartFile =
            await http.MultipartFile.fromPath('images[]', filePath);

        request.files.add(multipartFile);
        print("Added file size: ${multipartFile.length} bytes");
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print("Successful");
        update();
        return 200;
      } else if (response.statusCode == 500) {
        print("Server error");
        throw "No internet, try again";
      } else if (response.statusCode == 400) {
        print("Bad request");
        Get.snackbar(
          "Sorry you can't share it",
          "Don't be rude! The cultural sports community doesn't accept this kind of word.",
          animationDuration: const Duration(seconds: 2),
          duration: const Duration(seconds: 15),
          backgroundColor: Colors.white,
          backgroundGradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 85, 116, 143),
              Color.fromARGB(255, 75, 113, 168),
              Color.fromARGB(255, 116, 135, 185),
            ],
          ),
        );
        update();
        return 400;
      } else {
        print(response.reasonPhrase);
        print(response.statusCode);
      }
      update();
      return response.statusCode;
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }

  UserPostModel userPostAndBio = UserPostModel();
  Future<UserPostModel> getUserPostsAndBio(int? userId) async {
    Map<String, dynamic> jsonData = await Api().get(
        url: "${Constans.baseUrl}post/getUserPostsAndBio/$userId",
        token: userInfo?.getString("token"));
    update();

    userPostAndBio = UserPostModel.fromJson(jsonData);
    return userPostAndBio;
  }
}
