import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToast{
  static void toastMessage({required String message , bool isError = false}){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: isError == true ? Colors.red : Colors.green,
        textColor: Colors.white,
        fontSize: 13.0
    );
  }
}