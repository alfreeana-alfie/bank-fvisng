import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/models/users.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:http/http.dart' as http;

class DropDownStaff extends StatefulWidget {
  const DropDownStaff(
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
  _DropDownStaffState createState() => _DropDownStaffState();
}

class _DropDownStaffState extends State<DropDownStaff> {
  List<Users> userListNew = [];
  SharedPref sharedPref = SharedPref();

  void getCurrency() async {
    User user = User.fromJSON(await sharedPref.read(Pref.userData));
    String userId = user.id.toString();

    Uri viewSingleUser = Uri.parse(API.listofStaff.toString() + userId);
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
      print(Status.failed);
    }
  }

  @override
  void initState() {
    getCurrency();
    super.initState();
    print(userListNew);
  }

  @override
  Widget build(BuildContext context) {
    return _dropDownSearch();
  }

  _dropDownSearch() {
    return DropdownSearch<Users>(
      showSearchBox: true,
      onChanged: widget.onChanged,
      itemAsString: (planListNew) {
        return planListNew!.name ?? Field.empty ;
      },
      onFind: (String? filter) => getData(filter),
      dropdownSearchDecoration: InputDecoration(
        labelText: Str.selectUser,
        contentPadding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.black12.withOpacity(0.05),
      ),
    );
  }

  Future<List<Users>> getData(filter) async {
    return userListNew;
  }
}