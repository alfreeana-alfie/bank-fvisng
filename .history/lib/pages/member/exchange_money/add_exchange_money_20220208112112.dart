import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/methods/member/exchange_money_methods.dart';
import 'package:flutter_banking_app/models/currency.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/pages/member/checkout/payment_method_send.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/dropdown/dropdown_account.dart';
import 'package:flutter_banking_app/widgets/dropdown/dropdrown_currency.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;

class MCreateExchangeMoney extends StatefulWidget {
  const MCreateExchangeMoney({Key? key}) : super(key: key);

  @override
  _ExchangeMoneyState createState() => _ExchangeMoneyState();
}

class _ExchangeMoneyState extends State<MCreateExchangeMoney> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();

  final ScrollController _scrollController = ScrollController();

  String? exchangeFrom,
      exchangeFromName,
      exchangeTo,
      exchangeToName,
      amount,
      note,
      // userId,
      // userPhone,
      account,
      accountName,
      accountBalance,
      walletId;

  String currencyId = '1',
      fee = '1',
      drCr = '1',
      type = '1',
      method = 'exchange_money',
      status = 'exchange_money',
      loanId = '1',
      refId = '1',
      parentId = '1',
      otherBankId = '1',
      gatewayId = '1',
      createdUserId = '1',
      updatedUserId = '1',
      branchId = '1',
      transactionsDetails = '1';

  List<Currency> currencyListNew = [];

  int? currentRate;

  Future getCurrentRate() async {
    Uri viewSingleUser =
        Uri.parse(API.getCurrentRateByFunctionName.toString() + method);
    final response = await http.get(viewSingleUser, headers: headers);

    if (response.statusCode == Status.ok) {
      setState(() {
        currentRate = jsonDecode(response.body);
      });
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

        // userId = user.id.toString();
        // userPhone = user.phone;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
    loadSharedPrefs();
    getCurrentRate();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: Str.exchangeMoneyTxt, implyLeading: true, context: context),
      body: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Styles.cardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child: Text(Str.accountTypeTxt,
                            style: Styles.primaryTitle),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child: Text(
                          '*',
                          style: TextStyle(color: Styles.dangerColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: DropDownAccount(
                      userId: '3',
                      walletId: walletId,
                      account: account,
                      accountName: accountName,
                      accountBalance: accountBalance,
                      onChanged: (val) {
                        setState(
                          () {
                            walletId = val!.id.toString();
                            account = val.accountId.toString();
                            accountName = val.description ?? 'DEFAULT';
                            accountBalance = val.amount ?? '0.00';
                          },
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 2,
                        child: DropDownCurrency(
                          currency: exchangeFrom,
                          currencyName: exchangeFromName,
                          onChanged: (val) {
                            setState(
                              () {
                                exchangeFrom = val!.id.toString();
                                exchangeFromName = val.name;
                              },
                            );
                          },
                        ),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Center(
                          child: Text('TO', style: Styles.primaryTitle),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: DropDownCurrency(
                          currency: exchangeTo,
                          currencyName: exchangeToName,
                          onChanged: (val) {
                            setState(
                              () {
                                exchangeTo = val!.id.toString();
                                exchangeToName = val.name;
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(20.0),
                  NewField(
                    onSaved: (val) => amount = val,
                    hintText: Str.amountTxt,
                    labelText: Str.amountNumTxt,
                  ),
                  NewField(
                      onSaved: (val) => note = val, hintText: Str.noteTxt),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                color: Styles.primaryColor,
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: elevatedButton(
                color: Styles.secondaryColor,
                context: context,
                callback: () {
                  Map<String, String> body = {
                    Field.userId: userLoad.id.toString(),
                    Field.currencyId: exchangeTo ?? Field.emptyString,
                    Field.amount: amount ?? '0.00',
                    Field.fee: fee,
                    Field.drCr: drCr,
                    Field.type: type,
                    Field.method: method,
                    Field.status: Status.pending.toString(),
                    Field.note: note ?? '-',
                    Field.loanId: loanId,
                    Field.refId: refId,
                    Field.parentId: parentId,
                    Field.otherBankId: otherBankId,
                    Field.gatewayId: gatewayId,
                    Field.createdUserId: userLoad.id.toString(),
                    Field.updatedUserId: userLoad.id.toString() ?? Field.emptyString,
                    Field.branchId: branchId,
                    Field.transactionsDetails: note ?? '-',
                    Field.transactionCode:
                        Field.transactionCodeInitials + getRandomCode(6)
                  };
                  ExchangeMoneyMethods.add(context, body);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentMethodWalletMenu(
                          // toUserId: toUserId,
                          
                          currentRate: currentRate.toString(),
                          walletId: walletId,
                          amount: amount ?? '0.00',
                          accountId: account ?? '0',
                          method: 'exchange_money',
                          creditDebit: 'credit',
                          walletBalance: accountBalance,
                          routePath: RouteSTR.exchangeMoneyListM,
                          userPhone: userPhone,
                          message:
                              'Exchange Money You have just exchange $amount from your account. FVIS Investment '),
                    ),
                  );
                },
                text: Str.exchangeMoneyTxt.toUpperCase(),
              ),
            ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
