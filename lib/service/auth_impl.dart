// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter_coffee/entities/http_client.dart';
import 'package:flutter_coffee/Models/user_model.dart';
import 'package:flutter_coffee/Service/auth_service.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl implements IAuthService {
  final SharedPreferences sharedPreferences;
  final HttpClient httpClient;

  AuthServiceImpl({
    this.httpClient,
    this.sharedPreferences,
  });

  @override
  Future<UserModel> signIn({
    String username,
    String password,
  }) async {
    String body = jsonEncode({
      "userName": username,
      "password": password,
    });

    Response response = await httpClient.post("/auth/signin", body);

    if (response.statusCode == 200) {
      var jsonDecoded = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(jsonDecoded);
      //sharedPreferences.setString("token", userModel.accessToken);
      return userModel;
    } else {
      var jsonDecoded = jsonDecode(response.body);
      print(jsonDecoded);
      throw Exception("Error");
    }
  }

  @override
  Future<String> signUp({
    String username,
    String firstname,
    String lastname,
    String address,
    String password,
  }) async {
    String body = jsonEncode({
      "userName": username,
      "firstName": firstname,
      "lastName": lastname,
      "address": address,
      "password": password,
    });

    Response response = await httpClient.post("/auth/signup", body);

    if (response.statusCode == 200) {
      dynamic jsonDecoded = jsonDecode(response.body);
      return response.body;
    } else {
      print(response.body);
      throw Exception("Error");
    }
  }
}
