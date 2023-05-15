import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/usermodel.dart';
class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;
  Future<void> fetchUsers() async {
    // Make API call to fetch user data and parse it
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    print("this is response ${response.body.toString()}");
    if(response.statusCode == 200){
      _users.clear();
      final List<dynamic> responseData = json.decode(response.body);
      _users = responseData.map((json) => User.fromJson(json)).toList();
      notifyListeners();
    }
    // return _users;
  }
}
