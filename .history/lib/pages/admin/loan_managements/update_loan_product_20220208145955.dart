import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/admin/loan_product_methods.dart';
import 'package:flutter_banking_app/models/loan_product.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UpdateLoanProduct extends StatefulWidget {
  const UpdateLoanProduct({Key? key, required this.loanProduct})
      : super(key: key);

  final LoanProduct loanProduct;

  @override
  _UpdateLoanProductState createState() => _UpdateLoanProductState();
}

class _UpdateLoanProductState extends State<UpdateLoanProduct> {
  final ScrollController _scrollController = ScrollController();
  int? status;

  String? name,
      minAmt,
      maxAmt,
      description,
      interestRate,
      interestType,
      term,
      termPeriod;

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
    // setState(() {
    //   name = widget.loanProduct.name;
    //   minAmt = widget.loanProduct.minAmt;
    //   maxAmt = widget.loanProduct.maxAmt;
    //   description = widget.loanProduct.description;
    //   interestRate = widget.loanProduct.interestRate;
    //   interestType = widget.loanProduct.interestType;
    //   term = widget.loanProduct.term.toString();
    //   termPeriod = widget.loanProduct.termPeriod;
    // });
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: Str.updateLoanProduct,
          implyLeading: true,
          context: context),
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
                    initialValue: widget.loanProduct.name,
                    onSaved: (val) => name = val,
                    hintText: Str.name,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.minAmt,
                    onSaved: (val) => minAmt = val,
                    hintText: Str.minAmt,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.maxAmt,
                    onSaved: (val) => maxAmt = val,
                    hintText: Str.maxAmt,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.description,
                    onSaved: (val) => description = val,
                    hintText: Str.description,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.interestRate,
                    onSaved: (val) => interestRate = val,
                    hintText: Str.interestRate,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.interestType,
                    onSaved: (val) => interestType = val,
                    hintText: Str.interestType,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.term.toString(),
                    onSaved: (val) => term = val,
                    hintText: Str.termPeriod,
                  ),
                  const Gap(20.0),
                  NewField(
                    mandatory: true,
                    initialValue: widget.loanProduct.termPeriod,
                    onSaved: (val) => termPeriod = val,
                    hintText: Str.termPeriod,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child:
                            Text(Str.status, style: Styles.primaryTitle),
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
                  ToggleSwitch(
                    initialLabelIndex: int.parse(widget.loanProduct.status!),
                    minWidth: 120,
                    cornerRadius: 7.0,
                    activeBgColors: const [
                      [Styles.dangerColor],
                      [Styles.successColor]
                    ],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.black12.withOpacity(0.05),
                    inactiveFgColor: Styles.textColor,
                    totalSwitches: 2,
                    labels: Field.statusList,
                    onToggle: (index) {
                      // print('switched to: $index');
                      status = index;
                    },
                  ),
                  const Gap(10),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Styles.primaryColor,
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0, vertical: 10),
                    child: elevatedButton(
                      color: Styles.secondaryColor,
                      context: context,
                      callback: () {
                        status ??= int.parse(widget.loanProduct.status!);
                        Map<String, String> body = {
                          Field.name: name ??
                              widget.loanProduct.name ??
                              Field.emptyString,
                          Field.minimumAmount: minAmt ??
                              widget.loanProduct.minAmt ??
                              Field.emptyString,
                          Field.maximumAmount: maxAmt ??
                              widget.loanProduct.maxAmt ??
                              Field.emptyString,
                          Field.description: description ??
                              widget.loanProduct.description ??
                              Field.emptyString,
                          Field.interestRate: interestRate ??
                              widget.loanProduct.interestRate ??
                              Field.emptyString,
                          Field.interestType: interestType ??
                              widget.loanProduct.interestType ??
                              Field.emptyString,
                          Field.term:
                              term ?? widget.loanProduct.term.toString(),
                          Field.termPeriod: termPeriod ??
                              widget.loanProduct.termPeriod ??
                              Field.emptyString,
                          Field.status: status.toString(),
                        };

                        LoanProductMethods.edit(
                            context, body, widget.loanProduct.id.toString());
                      },
                      text: Str.submit,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
