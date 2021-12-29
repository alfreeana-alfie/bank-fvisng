import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/member/dashboard.dart';
import 'package:flutter_banking_app/pages/member/fdr/fdr_list.dart';
import 'package:flutter_banking_app/pages/member/loans/loan_list.dart';
import 'package:flutter_banking_app/pages/member/profile.dart';
import 'package:flutter_banking_app/pages/member/stats.dart';
import 'package:flutter_banking_app/pages/member/wallet/wallet.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/styles.dart';

class BottomNavInt extends StatefulWidget {
  const BottomNavInt({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<BottomNavInt> createState() => _BottomNavIntState();
}

class _BottomNavIntState extends State<BottomNavInt> {
  int _selectedIndex = 0;
  static final List<Widget> widgetOptions = <Widget>[
    const MemberDasboard(),
    const MLoanList(),
    const MFdrList(),
    const Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideDrawer(),
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: widgetOptions.elementAt(widget.index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Styles.primaryWithOpacityColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle:
            const TextStyle(fontSize: 20, color: Styles.primaryColor),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Styles.blueColor,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Document),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_rounded),
            label: 'Fixed Deposit',
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyBold.Profile),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
