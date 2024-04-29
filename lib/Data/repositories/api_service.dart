
import 'package:dio/dio.dart';
import 'package:flutter_code_structure/Services/api_client.dart';
import 'package:flutter_code_structure/config/app_url.dart';



class ApiService {
  final APIClient apiClient = APIClient();
  Future<Response> login({var params}) {
    return apiClient.post(url: AppUrl.users, params: params);
  }
  Future<Response> getUserData() {
    return apiClient.get(url: AppUrl.users,);
  }
}
