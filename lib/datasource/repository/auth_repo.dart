import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../remote/dio/dio_client.dart';


class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.dioClient, required this.sharedPreferences});


  Future<void> login({required String email, required String password}) async {
    try {
      Response? response = await dioClient.post(
        "url",
        data: {"email_or_phone": email, "email": email, "password": password}, queryParameters: {}, cancelToken: CancelToken(), onSendProgress: (int count, int total) {  }, onReceiveProgress: (int count, int total) {  },
      );
      if(response!.statusCode == 200){

      }else{

      }

    } catch (e) {
      if (kDebugMode) {
        print("this is error in login ");
      }
    }
  }

}
