import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/bank.dart';
import 'package:flutter_banking_app/models/currency.dart';
import 'package:flutter_banking_app/models/loans.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/app_bar_add.dart';
import 'package:flutter_banking_app/widgets/card_bank.dart';
import 'package:flutter_banking_app/widgets/card_currency.dart';
import 'package:flutter_banking_app/widgets/card_loan.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class BankList extends StatefulWidget {
  const BankList({Key? key}) : super(key: key);

  @override
  _BankListState createState() => _BankListState();
}

class _BankListState extends State<BankList> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  late Map<String, dynamic> requestMap;
  List<Bank> bankList = [];

  Future viewOne(String userId) async {
    final response = await http.get(AdminAPI.listOfOtherBank, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);
      for (var req in jsonBody[Field.data]) {
        final data = Bank.fromMap(req);
        setState(() {
          bankList.add(data);
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
        path: RouteSTR.createBank,
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
              for (Bank bank in bankList) CardBank(bank: bank),
            ],
          ),
        ),
      ),
    );
  }
}
