import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_banking_app/utils/api.dart';

SharedPref sharedPref = SharedPref();
String userId = await sharedPref.read(Pref.accessToken);
void sendMoney() async {
}