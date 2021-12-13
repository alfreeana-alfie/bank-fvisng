import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

class LoanRequestMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      API.exchangeMoney,
      headers: API.headers,
      body: body,
    );

    if (response.statusCode == Status.created) {
      print(Status.successTxt);
    } else {
      print(Status.failedTxt);
    }
  }

  static void viewAll() async {
    final response = await http.get(API.listOfLoanRequest, headers: API.headers);

    if (response.statusCode == Status.ok) {
      
    } else {
      print(Status.failedTxt);
    }
  }

  static void viewOne(String userId) async {
    Uri viewSingleUser = Uri.parse(API.listOfLoanRequest.toString() + '/' + userId);
    final response = await http.get(viewSingleUser, headers: API.headers);

    if (response.statusCode == Status.ok) {
      
    } else {
      print(Status.failedTxt);
    }
  }
}
