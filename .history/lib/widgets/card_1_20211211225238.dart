import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/constant/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/utils/values.dart';
import 'package:flutter_banking_app/widgets/detail.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

// const loremIpsum =
//     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: Padding(
        padding: const EdgeInsets.only(
          left: Values.horizontalValue,
          right: Values.horizontalValue,
        ),
        child: Card(
          elevation: 0.2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: Container(
                  color: Styles.yellowColor,
                  child: ExpandablePanel(
                    theme: ExpandableThemeData(
                      iconColor: Styles.primaryColor,
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      tapBodyToCollapse: true,
                    ),
                    header: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/payment_request.svg',
                              width: 40,
                              height: 40,
                              color: Styles.primaryColor,
                            ),
                            const Gap(20),
                            Text('No Name',
                                style: Theme.of(context).textTheme.headline6),
                          ],
                        )),
                    collapsed: const Text(
                      '',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    expanded: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (var _ in Iterable.generate(5))
                          const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                'const',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                              )),
                      ],
                    ),
                    builder: (_, collapsed, expanded) {
                      return Column(
                        children: [
                          Expandable(
                            collapsed: buildCollapsed1(),
                            expanded: buildExpanded1(context),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCollapsed1() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  Str.viewDetailsTxt,
                ),
              ],
            ),
          ),
        ]);
  }

  buildExpanded1(BuildContext context) {
    return Container(
      color: Styles.accentColor,
      padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailRow(
                    labelTitle: Str.createdTxt, 
                    labelDetails: '01:27 AM'),
                DetailRow(
                    labelTitle: Str.currencyTxt,
                    labelDetails: 'USD'),
                DetailRow(
                    labelTitle: Str.amountTxt,
                    labelDetails: '\$100'),
                DetailRow(
                    labelTitle: Str.statusTxt,
                    labelDetails: 'PENDING'),
                DetailRow(
                    labelTitle: Str.descriptionTxt,
                    labelDetails: 'testing'),
                DetailRow(
                    labelTitle: Str.senderTxt,
                    labelDetails: 'Kalina (annkalina53@gmail.com)'),
                DetailRow(
                    labelTitle: Str.receiverTxt,
                    labelDetails: 'test1 (gmriyal@gmail.com)'),
                _buildButtonRow(context),
              ],
            ),
          ]),
    );
  }

  _buildButtonRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => EditUserPage(
              //       user: users,
              //     ),
              //   ),
              // );
            },
            child: Text(
              Str.payNowTxt.toUpperCase(),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0.0, primary: Styles.successColor),
          ),
        ),
        // const Gap(20),
        // Expanded(
        //   child: ElevatedButton(
        //     onPressed: () {
        //       _showMyDialog(context);
        //     },
        //     child: Text(
        //       Str.deleteTxt.toUpperCase(),
        //       style: GoogleFonts.nunitoSans(
        //         fontSize: 14,
        //         fontWeight: FontWeight.bold,
        //         color: Styles.primaryColor,
        //         letterSpacing: 0.5,
        //       ),
        //     ),
        //     style: ElevatedButton.styleFrom(
        //         elevation: 0.0, primary: Styles.dangerColor),
        //   ),
        // ),
      ],
    );
  }

  Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(Str.deleteConfirmationTxt),
        content: Text(Str.areYouSureTxt),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              Str.cancelTxt.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText1,
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0.0, primary: Styles.primaryColor),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pop();
            },
            child: Text(
              Str.deleteTxt.toUpperCase(),
              style: Theme.of(context).textTheme.button,
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0.0, primary: Styles.dangerColor),
          ),
          
        ],
      );
    },
  );
}
}