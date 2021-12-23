import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/currency.dart';
import 'package:flutter_banking_app/models/loans.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/app_bar_add.dart';
import 'package:flutter_banking_app/widgets/card_currency.dart';
import 'package:flutter_banking_app/widgets/card_loan.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class CurrencyList extends StatefulWidget {
  const CurrencyList({Key? key}) : super(key: key);

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  late Map<String, dynamic> requestMap;
  List<Currency> currList = [];

  Future viewOne(String userId) async {
    final response = await http.get(AdminAPI.listOfCurrency, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);
      for (var req in jsonBody[Field.data]) {
        final data = Currency.fromMap(req);
        setState(() {
          currList.add(data);
        });
      }
    } else {
      print(Status.failedTxt);
      CustomToast.showMsg(Status.failedTxt, Styles.dangerColor);
    }
  }

  loadSharedPrefs() async {
    try {
      User user = User.fromJSON(await sharedPref.read(Pref.userData));
      setState(() {
        userLoad = user;

        print(userLoad.id.toString());
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();

    loadSharedPrefs();
    viewOne('1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: addAppBar(
        title: Str.currencyListTxt,
        implyLeading: true,
        context: context,
        hasAction: true,
        path: RouteSTR.createCurrency,
      ),
      // drawer: SideDrawer(),
      backgroundColor: Styles.primaryColor,
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              for (Currency currency in currList) CardCurrency(currency: currency),
            ],
          ),
        ),
      ),
    );
  }
}