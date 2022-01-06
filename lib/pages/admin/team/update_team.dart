import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_banking_app/methods/admin/team_methods.dart';
import 'package:flutter_banking_app/models/team.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';

class UpdateTeam extends StatefulWidget {
  const UpdateTeam({Key? key, required this.team}) : super(key: key);

  final Team team;

  @override
  _UpdateTeamState createState() => _UpdateTeamState();
}

class _UpdateTeamState extends State<UpdateTeam> {
  final ScrollController _scrollController = ScrollController();

  String? name, role;
  // String? image;
  // FilePickerResult? result;
  // PlatformFile? file;
  // String fileType = 'All';

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

    // Widget fileDetails(PlatformFile file) {
    //   final kb = file.size / 1024;
    //   final mb = kb / 1024;
    //   final szize = (mb >= 1)
    //       ? '${mb.toStringAsFixed(2)} MB'
    //       : '${kb.toStringAsFixed(2)} KB';
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text('File Name: ${file.name}'),
    //         // Text('File Size: $size'),
    //         // Text('File Extension: ${file.extension}'),
    //         // Text('File Path: ${file.path}'),
    //       ],
    //     ),
    //   );
    // }

    return OKToast(
      child: Scaffold(
        backgroundColor: Styles.primaryColor,
        appBar: myAppBar(
            title: Str.createServiceTxt, implyLeading: true, context: context),
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
                    const Gap(20),
                    NewField(
                        mandatory: true,
                        initialValue: widget.team.name,
                        onSaved: (val) => name = val,
                        hintText: Str.nameTxt),
                    const Gap(20),
                    NewField(
                        mandatory: true,
                        initialValue: widget.team.role,
                        onSaved: (val) => role = val,
                        hintText: Str.roleTxt),
                    // const Gap(20),
                    // Container(
                    //   decoration: const BoxDecoration(
                    //     borderRadius: BorderRadius.vertical(
                    //       bottom: Radius.circular(15),
                    //     ),
                    //     color: Styles.cardColor,
                    //   ),
                    //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.stretch,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                    //         child: Text(Str.attachmentTxt,
                    //             style: Styles.primaryTitle),
                    //       ),
                    //       ElevatedButton(
                    //         onPressed: () async {
                    //           pickFiles(fileType);
                    //         },
                    //         child: Text(Str.browseTxt),
                    //         style: ElevatedButton.styleFrom(
                    //           elevation: 0.0,
                    //           primary: Styles.accentColor,
                    //         ),
                    //       ),
                    //       if (file != null) fileDetails(file!),
                    //     ],
                    //   ),
                    // ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 40),
                      child: elevatedButton(
                        color: Styles.secondaryColor,
                        context: context,
                        callback: () {
                          Map<String, String> body = {
                            Field.name: name ?? widget.team.name ?? Field.emptyString,
                            Field.role: role ?? widget.team.role ?? Field.emptyString,
                            // Field.image: file!.name,
                          };

                          TeamMethods.edit(
                              context, body,widget.team.id.toString());
                        },
                        text: Str.submitTxt.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void pickFiles(String? filetype) async {
  //   switch (filetype) {
  //     case 'Image':
  //       result = await FilePicker.platform.pickFiles(type: FileType.image);
  //       if (result == null) return;
  //       file = result!.files.first;
  //       setState(() {});
  //       break;
  //     case 'Video':
  //       result = await FilePicker.platform.pickFiles(type: FileType.video);
  //       if (result == null) return;
  //       file = result!.files.first;
  //       setState(() {});
  //       break;
  //     case 'Audio':
  //       result = await FilePicker.platform.pickFiles(type: FileType.audio);
  //       if (result == null) return;
  //       file = result!.files.first;
  //       setState(() {});
  //       break;
  //     case 'All':
  //       result = await FilePicker.platform.pickFiles();
  //       if (result == null) return;
  //       file = result!.files.first;
  //       setState(() {});
  //       break;
  //     case 'MultipleFile':
  //       result = await FilePicker.platform.pickFiles(allowMultiple: true);
  //       if (result == null) return;
  //       break;
  //   }
  // }
}
