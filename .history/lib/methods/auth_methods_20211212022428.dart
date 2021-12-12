import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/constant/api.dart';
import 'package:flutter_banking_app/constant/string.dart';
import 'package:flutter_banking_app/models/token.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void signIn(BuildContext context, Map<String, String> body) async {
  final response = await http.post(
    API.login,
    headers: API.headers,
    body: body,
  );

  if (response.statusCode == 200) {
    var jsonBody = Token.fromJSON(jsonDecode(response.body));
    String accessToken = jsonBody.token;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", access)
    getUserDetails(accessToken);
  } else {
    print(AuthSTR.failedAuthTxt);
  }
}

void getUserDetails(String accessToken) async {
  

  final response = await http.get(API.getUserDetails, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken',
  });

  if (response.statusCode == 200) {
    var jsonBody = User.fromJSON(jsonDecode(response.body));
    String? name = jsonBody.name;



    print(name);
  } else {
    print('d');
  }
}


void SignOut(String accessToken) async {
  final response = await http.get(API.getUserDetails, headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $accessToken',
  });

  if (response.statusCode == 200) {
    var jsonBody = User.fromJSON(jsonDecode(response.body));
    String? name = jsonBody.name;

    print(name);
  } else {
    print('d');
  }
}