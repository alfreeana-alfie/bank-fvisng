import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/transaction.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/app_bar_add.dart';
import 'package:flutter_banking_app/widgets/card_transaction.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class MWireTransferList extends StatefulWidget {
  const MWireTransferList({Key? key}) : super(key: key);

  @override
  _MWireTransferListState createState() => _MWireTransferListState();
}

class _MWireTransferListState extends State<MWireTransferList> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  late Map<String, dynamic> requestMap;
  List<Transaction> transactionList = [];

  Future viewOne(String userId) async {
    Uri viewSingleUser =
        Uri.parse(API.userWireTransferList.toString() + userId);
    final response = await http.get(viewSingleUser, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);
      for (var req in jsonBody[Field.data]) {
        final data = Transaction.fromMap(req);
        setState(() {
          transactionList.add(data);
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
    viewOne('3');
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Scaffold(
        appBar: addAppBar(
          title: Str.fdrHistoryTxt,
          implyLeading: true,
          context: context,
          hasAction: true,
          path: RouteSTR.addFdrM,
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
                for (Transaction transaction in transactionList) CardTransaction(transaction: transaction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
