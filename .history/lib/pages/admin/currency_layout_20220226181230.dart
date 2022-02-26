import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/currency.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CurrencyLayout extends StatefulWidget {
  const CurrencyLayout({Key? key, this.currency, this.type}) : super(key: key);

  final Currency? currency;
  final String? type;

  @override
  _CurrencyLayoutState createState() => _CurrencyLayoutState();
}

class _CurrencyLayoutState extends State<CurrencyLayout> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String? name, exchangeRate, baseCurrency;
  int? status;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: widget.type == Field.update
              ? Str.updateCurrency
              : Str.createCurrency,
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
                    initialValue: widget.type == Field.update
                        ? widget.currency?.name
                        : Field.empty,
                    onSaved: (val) => name = val,
                    hintText: Str.name,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                  ),
                  const Gap(20.0),
                  NewField(
                    initialValue: widget.type == Field.update
                        ? widget.currency?.exchangeRate
                        : Field.empty,
                    onSaved: (val) => exchangeRate = val,
                    hintText: Str.exchangeRate,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                  ),
                  const Gap(20),
                  NewField(
                    initialValue: widget.type == Field.update
                        ? widget.currency?.baseCurrency.toString()
                        : Field.empty,
                    onSaved: (val) => baseCurrency = val,
                    hintText: Str.baseCurrency,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child: Text(Str.status, style: Styles.primaryTitle),
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
                    initialLabelIndex:
                        int.parse(widget.currency.status.toString()),
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
                  const Gap(20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: RoundedLoadingButton(
                      controller: _btnController,
                      color: Styles.secondaryColor,
                      onPressed: () {
                        Map<String, String> body = {
                          Field.name:
                              name ?? widget.currency?.name ?? Field.empty,
                          Field.exchangeRate: exchangeRate ??
                              widget.currency?.exchangeRate ??
                              Field.empty,
                          Field.baseCurrency: baseCurrency ??
                              widget.currency?.baseCurrency.toString() ??
                              Field.empty,
                          Field.status: status.toString(),
                        };

                        widget.type == Field.update
                            ? Method.edit(
                                context,
                                _btnController,
                                body,
                                Uri.parse(AdminAPI.updateCurrency.toString() +
                                    widget.currency!.id.toString()),
                                Type.currency,
                                CurrencyLayout(
                                  type: Field.create,
                                ),
                                Str.currencyList,
                                Field.empty)
                            : Method.add(
                                context,
                                _btnController,
                                body,
                                AdminAPI.createCurrency,
                                Type.currency,
                                CurrencyLayout(
                                  type: Field.create,
                                ),
                                Str.currencyList);
                      },
                      child: Text(Str.submit.toUpperCase()),
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
