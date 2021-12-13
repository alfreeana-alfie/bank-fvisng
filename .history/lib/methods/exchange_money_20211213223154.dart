import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

class ExchangeMoney {
  void exchangeMoney(BuildContext context, Map<String, String> body) async {
  final response = await http.post(
    API.exchangeMoney,
    headers: API.headers,
    body: body,
  );

  if (response.statusCode == ApiSTR.created) {
    print(ApiSTR.successTxt);
  } else {
    print(ApiSTR.failedTxt);
  }
}

void viewExchangeMoney() async {

}

void viewSingleExchangeMoney() async {
  
}
}
