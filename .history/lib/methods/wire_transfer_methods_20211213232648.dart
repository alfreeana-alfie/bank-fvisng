import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

class WireTransferMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      API.wireTransfer,
      headers: API.headers,
      body: body,
    );

    if (response.statusCode == ApiSTR.created) {
      print(ApiSTR.successTxt);
    } else {
      print(ApiSTR.failedTxt);
    }
  }

  static void viewAll() async {
    final response = await http.get(API.wire, headers: API.headers);

    if (response.statusCode == ApiSTR.ok) {
      
    } else {
      print(ApiSTR.failedTxt);
    }
  }

  static void viewOne(String userId) async {
    Uri viewSingleUser = Uri.parse(API.listOfSendMoney.toString() + '/' + userId);
    final response = await http.get(viewSingleUser, headers: API.headers);

    if (response.statusCode == ApiSTR.ok) {
      
    } else {
      print(ApiSTR.failedTxt);
    }
  }
}
