import 'package:flutter/material.dart';
import 'package:flutter_banking_app/pages/member/exchange_money.dart';
import 'package:flutter_banking_app/pages/member/loans/my_loan.dart';
import 'package:flutter_banking_app/pages/member/payment_request/all_request.dart';
import 'package:flutter_banking_app/pages/member/send_money.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';

List shortcutList = [
  {
    'color': const Color(0xFFFB6A4B),
    'icon': IconlyBold.Upload,
    'route': const SendMoney(),
  },
  {
    'color': const Color(0xFF026EF4),
    'icon': IconlyBold.Download,
    'route': const AllRequest(),
  },
  {
    'color': const Color(0xFF2BB33A),
    'icon': Icons.change_circle,
    'route': const ExchangeMoney(),
  },
  {
    'color': const Color(0xFFAF52C1),
    'icon': Icons.money,
    'route': const MyLoan(),
  },
];

List profilesShortcutList = [
  {
    'color': const Color(0xFFe2a935),
    'icon': IconlyBold.Chart,
  },
  {
    'color': const Color(0xFF2290b8),
    'icon': IconlyBold.Notification,
  },
  {
    'color': const Color(0xFF6bcde8),
    'icon': IconlyBold.Setting,
  },
  {
    'color': const Color(0xFF6b41dc),
    'icon': Icons.logout,
    ''
  },
];
