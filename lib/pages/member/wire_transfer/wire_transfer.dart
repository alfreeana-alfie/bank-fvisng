import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/methods/member/wire_transfer_methods.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/dropdown/dropdown_bank.dart';
import 'package:flutter_banking_app/widgets/dropdown/dropdrown_currency.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MCreateWireTransfer extends StatefulWidget {
  const MCreateWireTransfer({Key? key}) : super(key: key);

  @override
  _MCreateWireTransferState createState() => _MCreateWireTransferState();
}

class _MCreateWireTransferState extends State<MCreateWireTransfer> {
  final ScrollController _scrollController = ScrollController();
  SharedPref sharedPref = SharedPref();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String? currency,
      currencyName,
      userId,
      otherBankId,
      otherBankName,
      amount,
      note,
      swiftCode,
      accountHolder,
      accountHolderName;

  String fee = '1',
      drCr = '1',
      type = '1',
      method = 'wire_transfer',
      status = '1',
      loanId = '1',
      refId = '1',
      parentId = '1',
      gatewayId = '1',
      createdUserId = '1',
      updatedUserId = '1',
      branchId = '1',
      transactionsDetails = 'wire_transfer';

  String? transactionCode;

  loadSharedPrefs() async {
    try {
      User user = User.fromJSON(await sharedPref.read(Pref.userData));
      setState(() {
        userId = user.id.toString();
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
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    setState(() {
      transactionCode = Field.transactionCodeInitials + getRandomCode(6);
    });

    return OKToast(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: myAppBar(
            title: Str.wireTransferTxt, implyLeading: true, context: context),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              width: double.infinity,
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
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NewField(
                        mandatory: true,
                        readOnly: true,
                        initialValue: transactionCode,
                        onSaved: (val) => transactionCode = val,
                        hintText: Str.transactionCodeTxt),
                    const Gap(20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                          child: Text(Str.bankTxt, style: Styles.primaryTitle),
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
                      child: DropDownBank(
                        bank: otherBankId,
                        bankName: otherBankName,
                        onChanged: (val) {
                          setState(
                            () {
                              otherBankId = val!.id.toString();
                              otherBankName = val.name;
                            },
                          );
                        },
                      ),
                    ),
                    const Gap(20.0),
                    NewField(
                        mandatory: true,
                        onSaved: (val) => swiftCode = val,
                        hintText: Str.swiftCodeTxt),
                    const Gap(20.0),
                    NewField(
                      mandatory: true,
                      onSaved: (val) => amount = val,
                      hintText: Str.amountTxt,
                      labelText: Str.amountNumTxt,
                    ),
                    const Gap(20.0),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                          child:
                              Text(Str.currencyTxt, style: Styles.primaryTitle),
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
                      child: DropDownCurrency(
                        currency: currency,
                        currencyName: currencyName,
                        onChanged: (val) {
                          setState(
                            () {
                              currency = val!.id.toString();
                              currencyName = val.name;
                            },
                          );
                        },
                      ),
                    ),
                    const Gap(20.0),
                    NewField(
                      mandatory: true,
                      onSaved: (val) => accountHolder = val,
                      hintText: Str.accountHolderTxt,
                    ),
                    const Gap(20.0),
                    NewField(
                      mandatory: true,
                      onSaved: (val) => accountHolderName = val,
                      hintText: Str.accountHolderNameTxt,
                    ),
                    const Gap(20.0),
                    NewField(
                      onSaved: (val) => note = val,
                      hintText: Str.descriptionTxt,
                    ),
                    const Gap(20),
                    loadingButton(
                      context: context, 
                      callback: () {
                              Map<String, String> body = {
                                Field.userId: userId ?? Field.empty,
                                Field.currencyId: currency ?? Field.empty,
                                Field.amount: amount ?? Field.emptyAmount,
                                Field.fee: fee,
                                Field.drCr: drCr,
                                Field.type: type,
                                Field.method: method,
                                Field.status: status,
                                Field.note: note ?? Field.emptyString,
                                Field.loanId: loanId,
                                Field.refId: refId,
                                Field.parentId: parentId,
                                Field.otherBankId: otherBankId ?? Field.empty,
                                Field.gatewayId: gatewayId,
                                Field.createdUserId: userId ?? Field.empty,
                                Field.updatedUserId: userId ?? Field.empty,
                                Field.branchId: branchId,
                                Field.transactionsDetails: transactionsDetails,
                                Field.transactionCode: Field.transactionCodeInitials + getRandomCode(6)
                              };

                              WireTransferMethods.add(context, body);
                      }, 
                    text: Str.wireTransferTxt.toUpperCase())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
