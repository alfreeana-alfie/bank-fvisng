import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/bottom_nav.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'FVIS',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'DMSans',
//         primaryColor: Styles.primaryColor,
//         backgroundColor: Styles.primaryColor,
//       ),
//       home: const BottomNav(),
//     );
//   }
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
}