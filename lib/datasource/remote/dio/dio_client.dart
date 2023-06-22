import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor? loggingInterceptor;
  final SharedPreferences? sharedPreferences;

  Dio? dio;
  String? token;

  DioClient(this.baseUrl,
      Dio dioC, {
        this.loggingInterceptor,
        this.sharedPreferences,
      }) {
    token = sharedPreferences!.getString("AppConstants.TOKEN");
    print('token -----> $token');

    updateHeader(getToken: '');


  }

  Future<void> updateHeader({required String getToken})async {
    dio =  Dio();
    dio!
      ..options.baseUrl = baseUrl
      // ..options.connectTimeout = ResponsiveHelper.isMobilePhone() ? 30000 : 60 * 30000
      // ..options.receiveTimeout = ResponsiveHelper.isMobilePhone() ? 30000 : 60 * 30000
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${getToken ?? token}',

      };
    dio!.interceptors.add(loggingInterceptor!);
  }



  Future<Response> get(String uri, {
    required Map<String, dynamic> queryParameters,
    required CancelToken cancelToken,
    required ProgressCallback onReceiveProgress,
  }) async {
    try {
      debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response?> post(String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    required CancelToken cancelToken,
    required ProgressCallback onSendProgress,
    required ProgressCallback onReceiveProgress,
  }) async {
    try {
      debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio?.options.headers}');

      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> put(String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    required CancelToken cancelToken,
    required ProgressCallback onSendProgress,
    required ProgressCallback onReceiveProgress,
  }) async {
    debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');

    try {
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }

  Future<Response> delete(String uri, {
    data,
    required Map<String, dynamic> queryParameters,
    required CancelToken cancelToken,
  }) async {
    debugPrint('apiCall ==> url=> $uri \nparams---> $queryParameters\nheader=> ${dio!.options.headers}');

    try {
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data");
    } catch (e) {
      throw e;
    }
  }
}
