import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_flutter_project/config/app_constant.dart';
import 'package:simple_flutter_project/config/app_url.dart';

class APIClient {
  late final prefs =  SharedPreferences.getInstance();
  Dio _dio = Dio();
  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${AppConstant.getUserToken}'
  };

  APIClient() {
    BaseOptions baseOptions = BaseOptions(
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      baseUrl: AppUrl.baseUrl,
      maxRedirects: 2,
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  /// for Get request.
  Future<Response> get({required String url,}) async {
    Response response;
    try {
      response = await _dio.get(url, options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      String content = exception.response.toString();
      rethrow;
    }
    return response;
  }

  /// for Post request.
  Future<Response> post({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.post(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      if(exception.response != null){
        String content = exception.response.toString();
        Map<String, dynamic> map = jsonDecode(exception.response.toString());
        // AppConstants.flutterToast(message: map['message']);
        print("this is error in dio ${map['message'].toString()}");
      }
      rethrow;
    }
    return response;
  }

  /// for delete request
  Future<Response> delete({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.delete(url,
          data: params,
          options: Options(responseType: ResponseType.json, headers: headers));
    } on DioException catch (exception) {
      if(exception.response != null){
        String content = exception.response.toString();
        Map<String, dynamic> map = jsonDecode(exception.response.toString());
        // AppConstants.flutterToast(message: map['message']);
        print("this is error in dio ${map['message'].toString()}");
        print("this is error in dio complete map in delte method ${exception.response!.statusCode.toString()}");
      }

      rethrow;
    }
    return response;
  }

  /// for Put Request.
  Future<Response> put({required String url, var params}) async {
    Response response;
    try {
      response = await _dio.put(url,
          data: params,
          options: Options(
            responseType: ResponseType.json,
          ));
    } on DioException catch (exception) {
      String content = exception.response.toString();
      if(exception.response != null){
        print("this si status code ${exception.response!.statusCode}");
        Map<String, dynamic> map = exception.response!.data;
        // AppConstants.flutterToast(message: map['message']);
      }
      rethrow;
    }
    return response;
  }

//   // for download Request.
//   Future<Response> download(String url, String pathName, void Function(int, int)? onReceiveProgress) async {
//  //   logger.i("${AppConstant.getUserToken}this is my user token");
//     Response response;
//     try {
//       response = await _dio.download(
//         url,
//         pathName,
//         onReceiveProgress: onReceiveProgress,
//       );
//     } on DioException catch (exception) {
//       String content = exception.response.toString();
//       // AppConstant.logger
//       //     .e("this is error in dio api client : ${content.toString()}");
//       rethrow;
//     }
//     return response;
//   }
 }
