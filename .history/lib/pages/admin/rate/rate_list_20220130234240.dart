import 'dart:convert';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/deposit.dart';
import 'package:flutter_banking_app/models/rate.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/appbar/app_bar_add.dart';
import 'package:flutter_banking_app/widgets/card/card_deposit.dart';
import 'package:flutter_banking_app/widgets/card/card_rate.dart';
import 'package:flutter_banking_app/widgets/left_menu.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:oktoast/oktoast.dart';

class RateList extends StatefulWidget {
  const RateList({Key? key}) : super(key: key);

  @override
  _RateListState createState() => _RateListState();
}

class _RateListState extends State<RateList> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  late Map<String, dynamic> requestMap;
  List<Rate> rateList = [];

  Future view() async {
    final response = await http.get(AdminAPI.listOfRate, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);
      for (var req in jsonBody[Field.data]) {
        final data = Rate.fromMap(req);
        if (mounted) {
          rateList.add(data);
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
        //   title: Str.depositTxt,
        //   implyLeading: true,
        //   context: context,
        //   hasAction: true,
        //   path: RouteSTR.createRate,
        //   // onTap: () => Scaffold.of(context).openDrawer(),
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
                            Str.rateListTxt,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Styles.textColor,
                                fontSize: 19),
                          ),
                        ),
                        const Gap(10),
                        InkWell(
                          // onTap: () => Navigator.pushNamed(
                          //     context, RouteSTR.createRate),
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
                      return CardRate(
                        deposit: rateList[index],
                        rateList: rateList,
                        index: index,
                      );
                    },
                    itemCount: rateList.length,
                  ),
                ),
                // for (Rate deposit in rateList)
                //   CardRate(deposit: deposit),
              ],
            );
            // return ExpandableTheme(
            //   data: const ExpandableThemeData(
            //     iconColor: Colors.blue,
            //     useInkWell: true,
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 10.0),
            //     child: ListView(
            //       physics: const BouncingScrollPhysics(),
            //       children: [
            //         for (Rate deposit in rateList)
            //           CardRate(deposit: deposit),
            //       ],
            //     ),
            //   ),
            // );
          }
        }
      },
    );
  }
}