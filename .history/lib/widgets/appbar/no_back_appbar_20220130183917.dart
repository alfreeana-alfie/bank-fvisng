import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_light.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:gap/gap.dart';

AppBar noBackAppBar(
    {required String title,
    String? stringColor,
    required bool implyLeading,
    required BuildContext context,
    bool? hasAction,
    path}) {
  return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(color: Styles.textColor, fontSize: 18),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: implyLeading == true
      //     ? Transform.scale(
      //         scale: 0.7,
      //         child: IconButton(
      //           icon: const Icon(Icons.keyboard_backspace_rounded,
      //               size: 33, color: Styles.accentColor),
      //           onPressed: () => Navigator.pop(context),
      //         ))
      //     : const SizedBox(),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: IconButton(
            icon: const Icon(Icons.add, size: 33, color: Styles.accentColor),
            onPressed: () => Navigator.pushNamed(context, path),
          ),
        )
      ]);
}