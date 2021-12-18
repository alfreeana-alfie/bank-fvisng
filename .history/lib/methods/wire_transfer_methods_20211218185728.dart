import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

class WireTransferMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      API.wireTransfer,
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
    final response = await http.get(API.listOfWireTransfer, headers: API.headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var userData in jsonBody['data']) {
        print(userData);
      }

      // print(jsonData.amount);
    } else {
      print(Status.failedTxt);
    }
  }

  static void viewOne(String userId) async {
    Uri viewSingleUser =
        Uri.parse(API.userWireTransferList.toString() + userId);
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
