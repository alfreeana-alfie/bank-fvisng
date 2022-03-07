import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/rate.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RateLayout extends StatefulWidget {
  const RateLayout({Key? key, this.rate, this.type}) : super(key: key);

  final Rate? rate;
  final String? type;

  @override
  _RateLayoutState createState() => _RateLayoutState();
}

class _RateLayoutState extends State<RateLayout> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String? functionName, currentRate, baseCurrency;
  int? status;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: widget.type == Field.update ? Str.updateCurrency : Field.empty,
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
                    readOnly: true,
                    initialValue: widget.type == Field.update
                        ? widget.rate?.functionName
                        : Field.empty,
                    onSaved: (val) => functionName = val,
                    hintText: Str.functionName,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  const Gap(20.0),
                  NewField(
                    initialValue: widget.type == Field.update
                        ? widget.rate?.currentRate
                        : Field.empty,
                    onSaved: (val) => currentRate = val,
                    hintText: Str.currentRate,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: RoundedLoadingButton(
                      controller: _btnController,
                      color: Styles.secondaryColor,
                      onPressed: () {
                        Map<String, String> body = {
                          Field.functionName: functionName ??
                              widget.rate?.functionName ??
                              Field.emptyString,
                          Field.currentRate: currentRate ??
                              widget.rate?.currentRate ??
                              Field.currentRate,
                        };

                        // RateMethods.edit(
                        //     context, body, widget.rate.id.toString());
                        Method.edit(
                            context,
                            _btnController,
                            body,
                            Uri.parse(AdminAPI.updateRate.toString() +
                                widget.rate!.id.toString()),
                            Type.rate,
                            RateLayout(
                              type: Field.create,
                            ),
                            Str.rateList,
                            Type.nullable);
                      },
                      child: Text(Str.submit.toUpperCase()),
                    ),
                  ),
                  back
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
