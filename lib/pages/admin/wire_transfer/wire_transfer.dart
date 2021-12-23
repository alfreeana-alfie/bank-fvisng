import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/member/wire_transfer_methods.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/dropdrown_currency.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

class CreateWireTransfer extends StatefulWidget {
  const CreateWireTransfer({Key? key}) : super(key: key);

  @override
  _CreateWireTransferState createState() => _CreateWireTransferState();
}

class _CreateWireTransferState extends State<CreateWireTransfer> {
  final ScrollController _scrollController = ScrollController();

  String? currency, currencyName;

  String userId = '1',
      currencyId = '1',
      amount = '1',
      fee = '1',
      drCr = '1',
      type = '1',
      method = '1',
      status = '1',
      note = '1',
      loanId = '1',
      refId = '1',
      parentId = '1',
      otherBankId = '1',
      gatewayId = '1',
      createdUserId = '1',
      updatedUserId = '1',
      branchId = '1',
      transactionsDetails = '1';

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: Str.wireTransferTxt, implyLeading: true, context: context),
      // bottomSheet: Container(
      //   color: Styles.primaryColor,
      //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      //   child: elevatedButton(
      //     color: Styles.secondaryColor,
      //     context: context,
      //     callback: () {
      //       Map<String, String> body = {
      //         Field.userId: userId,
      //         Field.currencyId: currencyId,
      //         Field.amount: amount,
      //         Field.fee: fee,
      //         Field.drCr: drCr,
      //         Field.type: type,
      //         Field.method: method,
      //         Field.status: status,
      //         Field.note: note,
      //         Field.loanId: loanId,
      //         Field.refId: refId,
      //         Field.parentId: parentId,
      //         Field.otherBankId: otherBankId,
      //         Field.gatewayId: gatewayId,
      //         Field.createdUserId: createdUserId,
      //         Field.updatedUserId: updatedUserId,
      //         Field.branchId: branchId,
      //         Field.transactionsDetails: transactionsDetails
      //       };

      //       WireTransferMethods.add(context, body);
      //     },
      //     text: Str.wireTransferTxt.toUpperCase(),
      //   ),
      // ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.primaryWithOpacityColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 8),
                              child: Text(Str.bankTxt,
                                  style: Styles.subtitleStyle)),
                          const Gap(20.0),
                          DropDownCurrency(
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
                        ],
                      ),
                      const Gap(20.0),
                      TextFormField(
                        readOnly: true,
                        onChanged: (val) {},
                        style: Styles.subtitleStyle,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: Str.swiftCodeTxt,
                          labelStyle: Styles.subtitleStyle,
                          hintText: Str.swiftCodeTxt,
                          hintStyle: Styles.subtitleStyle03,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 0.0,
                          ),
                        ),
                      ),
                      const Gap(20.0),
                      TextFormField(
                        readOnly: true,
                        onChanged: (val) {},
                        style: Styles.subtitleStyle,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: Str.currencyTxt,
                          labelStyle: Styles.subtitleStyle,
                          hintText: Str.amountNumTxt,
                          hintStyle: Styles.subtitleStyle03,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 0.0,
                          ),
                        ),
                      ),
                      const Gap(20.0),
                      TextFormField(
                        onChanged: (val) {},
                        style: Styles.subtitleStyle,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: Str.accountHolderTxt,
                          labelStyle: Styles.subtitleStyle,
                          hintText: Str.accountHolderTxt,
                          hintStyle: Styles.subtitleStyle03,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 0.0,
                          ),
                        ),
                      ),
                      const Gap(20.0),
                      TextFormField(
                        onChanged: (val) {},
                        style: Styles.subtitleStyle,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: Str.accountHolderNameTxt,
                          labelStyle: Styles.subtitleStyle,
                          hintText: Str.accountHolderNameTxt,
                          hintStyle: Styles.subtitleStyle03,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 0.0,
                          ),
                        ),
                      ),
                      const Gap(20.0),
                      TextFormField(
                        onChanged: (val) {},
                        style: Styles.subtitleStyle,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: Str.amountTxt,
                          labelStyle: Styles.subtitleStyle,
                          hintText: Str.amountNumTxt,
                          hintStyle: Styles.subtitleStyle03,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            gapPadding: 0.0,
                          ),
                        ),
                      ),
                      // const Gap(20.0),
                    ],
                  ),
                ),
                // Divider(color: Styles.primaryColor, thickness: 2),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(15)),
                    color: Styles.yellowColor,
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: TextFormField(
                    onChanged: (val) {},
                    style: Styles.subtitleStyleDark,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                      labelText: Str.descriptionTxt,
                      labelStyle: Styles.subtitleStyleDark02,
                      hintText: Str.descriptionTxt,
                      hintStyle: Styles.subtitleStyleDark03,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        gapPadding: 0.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Styles.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: elevatedButton(
                    color: Styles.secondaryColor,
                    context: context,
                    callback: () {
                      Map<String, String> body = {
                        Field.userId: userId,
                        Field.currencyId: currencyId,
                        Field.amount: amount,
                        Field.fee: fee,
                        Field.drCr: drCr,
                        Field.type: type,
                        Field.method: method,
                        Field.status: status,
                        Field.note: note,
                        Field.loanId: loanId,
                        Field.refId: refId,
                        Field.parentId: parentId,
                        Field.otherBankId: otherBankId,
                        Field.gatewayId: gatewayId,
                        Field.createdUserId: createdUserId,
                        Field.updatedUserId: updatedUserId,
                        Field.branchId: branchId,
                        Field.transactionsDetails: transactionsDetails
                      };

                      WireTransferMethods.add(context, body);
                    },
                    text: Str.wireTransferTxt.toUpperCase(),
                  ),
                ),
                // const Gap(10),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customColumn({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style:
                TextStyle(fontSize: 11, color: Colors.white.withOpacity(0.5))),
        const Gap(2),
        Text(subtitle,
            style:
                TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.8))),
      ],
    );
  }
}
