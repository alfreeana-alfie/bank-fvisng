import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/balance_box.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:gap/gap.dart';

import 'add_card.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Layouts.getSize(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar:
          myAppBar(title: Str.balanceTxt, implyLeading: true, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (c) => const AddCard())),
                child: Container(
                  width: size.width * 0.9,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Styles.accentColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.add, color: Colors.white, size: 20),
                      const Gap(10),
                      Text(Str.addNewCardTxt.toUpperCase(),
                          style: const TextStyle(color: Styles.whiteColor))
                    ],
                  ),
                ),
              ),
              
            ],
          ),
          const Gap(22),
          BalanceBox(),
          const Gap(20),
          BalanceBox(),
          const Gap(20),
          BalanceBox(),
        ],
      ),
    );
  }
}
