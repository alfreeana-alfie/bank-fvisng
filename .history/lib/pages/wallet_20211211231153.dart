import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/constant/string.dart';
import 'package:flutter_banking_app/generated/assets.dart';
import 'package:flutter_banking_app/pages/add_card.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/layouts.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/balance_box.dart';
import 'package:flutter_banking_app/widgets/my_app_bar.dart';
import 'package:gap/gap.dart';

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
                    color: Styles.primaryWithOpacityColor,
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
          
          const Gap(20),
          FittedBox(
            child: SizedBox(
              height: size.height * 0.23,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.67,
                    padding: const EdgeInsets.fromLTRB(16, 10, 0, 20),
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(15)),
                      color: Color(0xFFFF9E44),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(Assets.cardsPaionner,
                            width: 80, height: 50, fit: BoxFit.cover),
                        const Text('\$20,000.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.white)),
                        const Gap(20),
                        Text('CARD NUMBER',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12)),
                        const Gap(5),
                        const Text('3829 4820 4629 5025',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.27,
                    padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                          right: Radius.circular(15)),
                      color: Styles.yellowColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Styles.primaryColor,
                          ),
                          child: const Icon(Icons.swipe_rounded,
                              color: Colors.white, size: 20),
                        ),
                        const Spacer(),
                        const Text('VALID', style: TextStyle(fontSize: 12)),
                        const Gap(5),
                        const Text('05/22', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
