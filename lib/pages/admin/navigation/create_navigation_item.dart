import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/admin/navigation_methods.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';

class CreateNavigationItem extends StatefulWidget {
  const CreateNavigationItem({Key? key}) : super(key: key);

  @override
  _CreateNavigationItemState createState() => _CreateNavigationItemState();
}

class _CreateNavigationItemState extends State<CreateNavigationItem> {
  final ScrollController _scrollController = ScrollController();

  String? navigation, navigationName, type, url, target;

  @override
  void initState() {
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return OKToast(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: myAppBar(
            title: Str.createNavigationTxt, implyLeading: true, context: context),
        body: ListView(
          padding: const EdgeInsets.all(15),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Styles.accentColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          onChanged: (val) {
                            type = val;
                          },
                          style: Styles.subtitleStyle,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: Str.typeTxt,
                            labelStyle: Styles.subtitleStyle,
                            hintText: Str.typeTxt,
                            hintStyle: Styles.subtitleStyle03,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 0.0,
                            ),
                          ),
                        ),
                        const Gap(20),
                        TextFormField(
                          onChanged: (val) {
                            url = val;
                          },
                          style: Styles.subtitleStyle,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: Str.urlTxt,
                            labelStyle: Styles.subtitleStyle,
                            hintText: Str.urlTxt,
                            hintStyle: Styles.subtitleStyle03,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 0.0,
                            ),
                          ),
                        ),
                        const Gap(20),
                        TextFormField(
                          onChanged: (val) {
                            target = val;
                          },
                          style: Styles.subtitleStyle,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          maxLines: 1,
                          decoration: InputDecoration(
                            labelText: Str.targetTxt,
                            labelStyle: Styles.subtitleStyle,
                            hintText: Str.targetTxt,
                            hintStyle: Styles.subtitleStyle03,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              gapPadding: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // color: Styles.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: elevatedButton(
                color: Styles.secondaryColor,
                context: context,
                callback: () {
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

                  NavigationMethods.add(context, body);
                },
                text: Str.submitTxt.toUpperCase(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}