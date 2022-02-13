import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CreateBranch extends StatefulWidget {
  const CreateBranch({Key? key}) : super(key: key);

  @override
  _CreateBranchState createState() => _CreateBranchState();
}

class _CreateBranchState extends State<CreateBranch> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String? name, contactEmail, contactPhone, address, descriptions;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: Str.createBranch, implyLeading: true, context: context),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Styles.cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NewField(
                    mana
                    onSaved: (val) => name = val, 
                    hintText: Str.name,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,),
                  const Gap(20.0),
                  NewField(
                    onSaved: (val) => contactEmail = val,
                    hintText: Str.contactEmail,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    // maxLines: 10,
                  ),
                  const Gap(20.0),
                  NewField(
                    onSaved: (val) => contactPhone = val,
                    hintText: Str.contactPhone,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.phone,
                    // maxLines: 10,
                  ),
                  const Gap(20.0),
                  NewField(
                    onSaved: (val) => address = val,
                    hintText: Str.address,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.streetAddress,
                    // maxLines: 10,
                  ),
                  const Gap(20.0),
                  NewField(
                    onSaved: (val) => descriptions = val,
                    hintText: Str.descriptions,
                    maxLines: 5,
                    textInputAction: TextInputAction.newline,
                    textInputType: TextInputType.text,
                  ),
                  const Gap(20),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: RoundedLoadingButton(
                      controller: _btnController,
                      color: Styles.secondaryColor,
                      onPressed: () {
                        Map<String, String> body = {
                          Field.name: name ?? Field.emptyString,
                          Field.contactEmail: contactEmail ?? Field.emptyString,
                          Field.contactPhone: contactPhone ?? Field.emptyAmount,
                          Field.address: address ?? Field.emptyString,
                          Field.descriptions: descriptions ?? Field.emptyString,
                        };

                        Method.add(
                            context,
                            _btnController,
                            body,
                            AdminAPI.createBranch,
                            Type.branch,
                            RouteSTR.createBranch,
                            Str.branchList);
                        // BranchMethods.add(context, body);
                      },
                      child: Text(Str.submit.toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}