import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/models/users.dart';
import 'package:flutter_banking_app/models/users.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/iconly/iconly_bold.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:http/http.dart' as http;

class DropDownUser extends StatefulWidget {
  const DropDownUser(
      {Key? key,
      this.users,
      this.usersName,
      // required this.usersList,
      required this.onChanged})
      : super(key: key);

  final String? users, usersName;
  final void Function(Users?) onChanged;
  // final List<Users> usersList;

  @override
  _DropDownUserState createState() => _DropDownUserState();
}

class _DropDownUserState extends State<DropDownUser> {
  List<Users> userListNew = [];

  void getCurrency() async {
    User user = User.fromJSON(await sharedPref.read(Pref.userData));
    String userId = user.id.toString();
    
    Uri viewSingleUser = Uri.parse(API.userSendMoneyList.toString() + userId);
    final response = await http.get(viewSingleUser, headers: headers);

    if (response.statusCode == Status.ok) {
      var jsonBody = jsonDecode(response.body);

      for (var data in jsonBody[Field.data]) {
        final user = Users.fromMap(data);

        setState(() {
          userListNew.add(user);
        });
      }
    } else {
      print(Status.failedTxt);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrency();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: Colors.black12.withOpacity(0.05),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: Styles.greyColor,
          icon: const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.chevron_left,
                size: 20,
                color: Styles.textColor,
              )),
          hint: widget.usersName == null
              ? Text(Str.usersTxt, style: Styles.primaryTitle)
              : Text(
                  widget.usersName!,
                  style: Styles.primaryTitle,
                ),
          isExpanded: true,
          iconSize: 30.0,
          style: Styles.primaryTitle,
          items: userListNew.map(
            (val) {
              return DropdownMenuItem<Users>(
                value: val,
                child: Text(val.name ?? Field.emptyString),
              );
            },
          ).toList(),
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
