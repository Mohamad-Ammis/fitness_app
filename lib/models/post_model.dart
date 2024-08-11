// ignore_for_file: public_member_api_docs, sort_constructors_first
class PostModel {
  int? id;
  int? userId;
  int? likesCount;
  int? commentsCount;
  DateTime? time;
  bool? islike;
  String? textPost;
  String? username;
  String? userimage;
  List<CommentModel>? comments;
  List<ImagesModel>? imagesPost;

  PostModel({
    this.id,
    this.islike,
    this.likesCount,
    this.commentsCount,
    this.time,
    this.userId,
    this.textPost,
    this.username,
    this.userimage,
    this.comments,
    this.imagesPost,
  });
  factory PostModel.fromJson(dynamic jsonData, int i) {
    List<ImagesModel>? imagesList = [];
    if (jsonData[i]["images"] != null && jsonData[i]["images"].isNotEmpty) {
      for (var j = 0; j < jsonData[i]["images"].length; j++) {
        imagesList.add(ImagesModel.fromJson(jsonData[i]["images"][j]));
      }
    }
    List<CommentModel>? commentsList = [];
    if (jsonData[i]["comments"] != null && jsonData[i]["comments"].isNotEmpty) {
      for (var k = 0; k < jsonData[i]["comments"].length; k++) {
        commentsList.add(CommentModel.fromJson(jsonData[i]["comments"][k]));
      }
    }

    return PostModel(
        id: jsonData[i]["id"],
        islike: jsonData[i]["islike"],
        likesCount: jsonData[i]["likes_count"],
        commentsCount: jsonData[i]["comments_count"],
        time: DateTime.parse(jsonData[i]["created_at"]),
        textPost: jsonData[i]["body"],
        userId: jsonData[i]["postable_id"],
        username: jsonData[i]["user_name"],
        userimage: jsonData[i]["user_avatar"],
        imagesPost: imagesList,
        comments: commentsList);
  }
}

class CommentModel {
  int? idComment;
  int? likesCommentCount;
  bool? islikeComment;
  String? textComment;
  String? imageComment;
  String? username;
  String? userimage;

  CommentModel({
    this.idComment,
    this.islikeComment,
    this.likesCommentCount,
    this.textComment,
    this.imageComment,
    this.username,
    this.userimage,
  });
  factory CommentModel.fromJson(dynamic jsonData) {
    return CommentModel(
      idComment: jsonData["id"],
      islikeComment: jsonData["islikeComment"],
      likesCommentCount: jsonData["likes_comments_count"],
      textComment: jsonData["body"],
      imageComment: jsonData["comment_image"],
      username: jsonData["user_name"],
      userimage: jsonData["user_avatar"],
    );
  }
  factory CommentModel.fromJson1(dynamic jsonData) {
    return CommentModel(
      idComment: jsonData["id"],
      islikeComment: jsonData["islike"],
      textComment: jsonData["body"],
      imageComment: jsonData["image"],
      likesCommentCount: jsonData["likes_count"],
      username: jsonData["user_name"],
      userimage: jsonData["user_avatar"],
    );
  }
}

class ImagesModel {
  String? path;

  ImagesModel({
    this.path,
  });
  factory ImagesModel.fromJson(dynamic jsonData) {
    return ImagesModel(path: jsonData["path"]);
  }
}

class UserPostModel {
  String? bio;
  List<PostModel>? post;
 

  UserPostModel({
    this.bio,
    this.post,
  
  });

  factory UserPostModel.fromJson(dynamic jsonData) {
  
    List<PostModel>? postsListUser = [];
    if (jsonData["posts_with_bio"] != null && jsonData["posts_with_bio"].isNotEmpty) {
      for (var m = 0; m < jsonData["posts_with_bio"].length; m++) {
        postsListUser.add(PostModel.fromJson(jsonData["posts_with_bio"],m));
      }
    }

    return UserPostModel(
      bio: jsonData["user_bio"],
      post:postsListUser ,
     
    );
  }
}
