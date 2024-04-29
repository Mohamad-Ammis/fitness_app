import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class CustomSnackBar{
  SnackBar customSnackBar(String title,String desc,ContentType contentType) {
    return SnackBar(
      duration: const Duration(seconds: 3),
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: Container(
                  padding:  const EdgeInsets.symmetric(vertical:4),
                  height: 90,
                  width: double.infinity,
                  margin:const  EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                  child: AwesomeSnackbarContent(
                    
                    title: title,
                    message:
                  desc,
                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: contentType,
                  ),
                ),
              );
  }
                
}