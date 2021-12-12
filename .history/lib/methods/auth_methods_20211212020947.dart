import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/constant/api.dart';
import 'package:flutter_banking_app/constant/string.dart';
import 'package:flutter_banking_app/models/token.dart';
import 'package:flutter_banking_app/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void signIn(BuildContext context, Map<String, String> body) async {
  final response = await http.post(
    API.loginUrl,
    headers: API.headers,
    body: body,
  );

  if (response.statusCode == 200) {
    var verifyData = Token.fromJSON(jsonDecode(response.body));


  }else{
    print(AuthSTR.failedAuthTxt);
  }
}

void getUserDetails (String accessToken) async{
  final response = await http.post(
    API.loginUrl,
    headers: API.headers,
    body: {'email': email, 'password': password},
  );

  if (response.statusCode == 200) {
    var verifyData = Token.fromJSON(jsonDecode(response.body));


  }else{
    print(AuthSTR.failedAuthTxt);
  }
}