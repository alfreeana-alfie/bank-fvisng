import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/admin/faq_methods.dart';
import 'package:flutter_banking_app/models/faq.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:toggle_switch/toggle_switch.dart';

class UpdateFaq extends StatefulWidget {
  const UpdateFaq({Key? key, required this.faq}) : super(key: key);

  final Question faq;

  @override
  _UpdateFaqState createState() => _UpdateFaqState();
}

class _UpdateFaqState extends State<UpdateFaq> {
  final ScrollController _scrollController = ScrollController();

  String? answer, question;
  int? status;

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
    //   answer = widget.faq.answer;
    //   question = widget.faq.question;
    //   status = widget.faq.status;
    // });
    return OKToast(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: myAppBar(
            title: Str.createFaqTxt, implyLeading: true, context: context),
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
                        initialValue: widget.faq.question, 
                        onSaved: (val) => question = val,
                        hintText: Str.questionTxt),
                    const Gap(20),
                    NewField(
                        mandatory: true,
                        initialValue: widget.faq.answer,
                        onSaved: (val) => answer = val,
                        hintText: Str.answerTxt),
                    const Gap(20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                          child:
                              Text(Str.statusTxt, style: Styles.primaryTitle),
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
                      initialLabelIndex: widget.faq.status,
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
                          Map<String, String> body = {
                            Field.question: question ?? widget.faq.question ?? Field.emptyString,
                            Field.answer: answer ?? widget.faq.answer ?? Field.emptyString,
                            Field.locale: widget.faq.locale ?? Field.emptyString,
                            Field.status: status.toString()
                          };

                          FaqMethods.edit(context, body, widget.faq.id.toString());
                        },
                        text: Str.submitTxt.toUpperCase(),
                      ),
                    ),
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
