import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/admin/navigation_methods.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/utils/api.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/dropdown/dropdown_navigation.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CreateNavigationItem extends StatefulWidget {
  const CreateNavigationItem({Key? key}) : super(key: key);

  @override
  _CreateNavigationItemState createState() => _CreateNavigationItemState();
}

class _CreateNavigationItemState extends State<CreateNavigationItem> {
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  String? navigation, navigationName, type, url, target;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
          title: Str.createNavigation, implyLeading: true, context: context),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child: Text(Str.navigation, style: Styles.primaryTitle),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 0, 10),
                        child: Text(
                          '*',
                          style: TextStyle(color: Styles.dangerColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: DropDowNavigation(
                      navigation: navigation,
                      navigationName: navigationName,
                      onChanged: (val) {
                        setState(
                          () {
                            navigation = val!.id.toString();
                            navigationName = val.name;
                          },
                        );
                      },
                    ),
                  ),
                  const Gap(20),
                  NewField(
                    mandatory: true,
                    onSaved: (val) => type = val,
                    hintText: Str.type,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  const Gap(20),
                  NewField(
                    mandatory: true,
                    onSaved: (val) => url = val,
                    hintText: Str.url,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.url,
                  ),
                  const Gap(20),
                  NewField(
                    mandatory: true,
                    onSaved: (val) => target = val,
                    hintText: Str.target,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.text,
                  ),
                  const Gap(20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      color: Styles.primaryColor,
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    child: RoundedLoadingButton(
                      controller: _btnController,
                      color: Styles.secondaryColor,
                      width: double.maxFinite,
                      onPressed: () {
                        Map<String, String> body = {
                          Field.navigationId: navigation ?? Field.empty,
                          Field.type: type ?? Field.empty,
                          Field.pageId: Status.pending.toString(),
                          Field.url: url ?? Field.empty,
                          Field.icon: Status.pending.toString(),
                          Field.target: target ?? Field.empty,
                          Field.parentId: Status.pending.toString(),
                          Field.position: Status.pending.toString(),
                          Field.status: Status.pending.toString(),
                          Field.cssClass: Status.pending.toString(),
                          Field.cssId: Status.pending.toString(),
                        };

                        // NavigationMethods.add(context, body);
                        Method.add(
                            context,
                            _btnController,
                            body,
                            AdminAPI.createNavigationItem,
                            Type.loanProduct,
                            RouteSTR.createLoanProduct,
                            Str.loanProductList);
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