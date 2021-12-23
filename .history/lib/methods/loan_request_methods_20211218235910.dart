import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

class LoanRequestMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      API.loanRequest,
      headers: API.headers,
      body: body,
    );

    if (response.statusCode == Status.created) {
      print(Status.successTxt);
      CustomToast.showMsg(Status.successTxt, Styles.successColor);
    } else {
      print(Status.failedTxt);
      CustomToast.showMsg(Status.failedTxt, Styles.dangerColor);
    }
  }

  static void viewAll() async {
    final response = await http.get(API.listOfLoanRequest, headers: API.headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var userData in jsonBody['data']) {
        print(userData);
      }
    } else {
      print(Status.failedTxt);
      CustomToast.showMsg(Status.failedTxt, Styles.dangerColor);
    }
  }

  static void viewOne(String userId) async {
    Uri viewSingleUser =
        Uri.parse(API.userLoanRequestList.toString() + userId);
    final response = await http.get(viewSingleUser, headers: API.headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var userData in jsonBody['data']) {
        print(userData);
      }
    } else {
      print(Status.failedTxt);
      CustomToast.showMsg(Status.failedTxt, Styles.dangerColor);
    }
  }
}