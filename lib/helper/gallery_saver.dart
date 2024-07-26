import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class GallerySaverHelper {
  saveNetworkImage(String path, BuildContext context) async {
    try {
  var response = await Dio()
      .get(path, options: Options(responseType: ResponseType.bytes));
  final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 80,
      name: "hello");
  print(result);
  if (result['isSuccess'] == true) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Saved to gallery')));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('some thing went wrong')));
  }
} catch (e) {
  print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('some thing went wrong')));
}
  }

  saveAssestImage(String path, BuildContext context) async {
    try {
      var data = (await rootBundle.load(path)).buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(Uint8List.fromList(data),
          quality: 80, name: "hello");
      print(result);
      if (result['isSuccess'] == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Saved to gallery')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('some thing went wrong')));
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('some thing went wrong')));
    }
  }

  saveNetworkVideoFile(String path, BuildContext context) async {
    try {
      var appDocDir = await getTemporaryDirectory();
      String savePath = appDocDir.path + "/temp.mp4";
      String fileUrl = path;
      await Dio().download(fileUrl, savePath,
          onReceiveProgress: (count, total) {
        print((count / total * 100).toStringAsFixed(0) + "%");
      });
      final result = await ImageGallerySaver.saveFile(savePath);
      print(result);
      if (result['isSuccess'] == true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Saved to gallery')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('some thing went wrong')));
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('some thing went wrong')));
    }
  }
}
