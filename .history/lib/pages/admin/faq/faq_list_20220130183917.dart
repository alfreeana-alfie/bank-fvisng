import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/faq.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/appbar/app_bar_add.dart';
import 'package:flutter_banking_app/widgets/card/card_faq.dart';
import 'package:flutter_banking_app/widgets/left_menu.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class FaqList extends StatefulWidget {
  const FaqList({Key? key}) : super(key: key);

  @override
  _FaqListState createState() => _FaqListState();
}

class _FaqListState extends State<FaqList> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  late Map<String, dynamic> requestMap;
  List<Question> questionList = [];

  Future view() async {
    final response = await http.get(AdminAPI.listOfFaq, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);
      for (var req in jsonBody[Field.data]) {
        final data = Question.fromMap(req);
        if (mounted) {
          questionList.add(data);
        }
      }
    } else {
      print(Status.failedTxt);
      CustomToast.showMsg(Status.failedTxt, Styles.dangerColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: Scaffold(
        // appBar: addAppBar(
        //   title: Str.otherBankTxt,
        //   implyLeading: true,
        //   context: context,
        //   hasAction: true,
        //   path: RouteSTR.createBank,
        // ),
        drawer: const SideDrawer(),
        backgroundColor: Styles.primaryColor,
        body: _innerContainer(),
      ),
    );
  }

  _innerContainer() {
    return FutureBuilder(
      future: view(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Styles.accentColor,
            ),
          );
        } else {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => Scaffold.of(context).openDrawer(),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Styles.transparentColor,
                            ),
                            child: const Icon(
                              Icons.menu,
                              color: Styles.accentColor,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Center(
                          child: Text(
                            Str.faqListTxt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Styles.textColor,
                                fontSize: 19),
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          onTap: () => Navigator.pushNamed(
                              context, RouteSTR.createFaq),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Styles.transparentColor,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Styles.accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CardFaq(question: questionList[index], questionList: questionList, index: index,);
                    },
                    itemCount: questionList.length,
                  ),
                ),
                // for (Question question in questionList)
                //   CardFaq(question: question),
              ],
            );
          }
        }
      },
    );
  }
}