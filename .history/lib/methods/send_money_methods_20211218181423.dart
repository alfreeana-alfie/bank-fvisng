import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SendMoneyMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      API.sendMoney,
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
    final response = await http.get(API.listOfSendMoney, headers: API.headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var userData in jsonBody[Field.data]) {
        print(userData);
      }
    } else {
      print(Status.failedTxt);
      Fluttertoast.showToast(msg: Status.failedTxt, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.)
    }
  }

  static void viewOne(String userId) async {
    Uri viewSingleUser =
        Uri.parse(API.userSendMoneyList.toString() + '1');
    final response = await http.get(viewSingleUser, headers: API.headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var userData in jsonBody[Field.data]) {
        print(userData);
      }
    } else {
      print(Status.failedTxt);
    }
  }
}
