import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:simple_flutter_project/Presentation/Screens/HomeNew/Model/user_model.dart';
import 'package:simple_flutter_project/Data/repositories/api_service.dart';


class UserProvider with ChangeNotifier {
  ApiService apiService = ApiService();
  List<User> _users = [];

  List<User> get users => _users;
  Future<void> fetchUsers() async {
    // Make API call to fetch user data and parse it
    final response = await apiService.getUserData();
    if (kDebugMode) {
      // print("this is response ${response.data.toString()}");
    }
    if(response.statusCode == 200){
      _users.clear();
      print("this is waleed after addition");
      final List<dynamic> responseData = response.data;
      _users = responseData.map((json) => User.fromJson(json)).toList();
      print("this is waleed after addition");
      notifyListeners();
    }
    // return _users;
  }
}
