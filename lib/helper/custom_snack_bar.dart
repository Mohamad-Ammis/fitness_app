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
                  padding:  const EdgeInsets.all(0),
                  height: 90,
                  
                  margin:const  EdgeInsets.symmetric(vertical: 20),
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