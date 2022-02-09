import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

class TestimonialMethods {
  static void add(BuildContext context, Map<String, String> body) async {
    final response = await http.post(
      AdminAPI.createTestimonial,
      headers: headers,
      body: body,
    );

    if (response.statusCode == Status.created) {
      // print(Status.success);
      CustomToast.showMsg(Status.success, Styles.successColor);
      Future.delayed(const Duration(milliseconds: 2000), () {

        Navigator.pushReplacementNamed(context, RouteSTR.testimonialList);

      });
    } else {
      print(Status.failed);
      print(response.body);
      CustomToast.showMsg(Status.failed, Styles.dangerColor);
    }
  }

  static void editStatus(BuildContext context, Map<String, String> body, String id) async {
    Uri url =
        Uri.parse(AdminAPI.updateTestimonialStatus.toString() + id);

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == Status.ok) {
      // print(Status.success);
      CustomToast.showMsg(Status.success, Styles.successColor);
      Future.delayed(const Duration(milliseconds: 2000), () {

        Navigator.pushReplacementNamed(context, RouteSTR.testimonialList);

      });
    } else {
      // print(Status.failed);
      CustomToast.showMsg(Status.failed, Styles.dangerColor);
    }
  }

  static void edit(BuildContext context, Map<String, String> body, String id) async {
    Uri url =
        Uri.parse(AdminAPI.updateTestimonial.toString() + id);

    final response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == Status.ok) {
      // print(Status.success);
      CustomToast.showMsg(Status.success, Styles.successColor);
      Future.delayed(const Duration(milliseconds: 2000), () {

        Navigator.pushReplacementNamed(context, RouteSTR.testimonialList);

      });
    } else {
      print(Status.failed);
      print(response.body);
      CustomToast.showMsg(Status.failed, Styles.dangerColor);
    }
  }

  static void delete(BuildContext context, String id) async {
    Uri url =
        Uri.parse(AdminAPI.deleteTestimonial.toString() + id);

    final response = await http.delete(
      url,
      headers: headers
    );

    if (response.statusCode == Status.ok) {
      CustomToast.showMsg(Status.success, Styles.successColor);
      // Future.delayed(const Duration(milliseconds: 2000), () {

      //   Navigator.pushReplacementNamed(context, RouteSTR.currencyList);

      // });
    } else {
      print(Status.failed);
      CustomToast.showMsg(Status.failed, Styles.dangerColor);
    }
  }
}