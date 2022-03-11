import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banking_app/methods/config.dart';
import 'package:flutter_banking_app/models/user.dart';
import 'package:flutter_banking_app/models/wallet.dart';
import 'package:flutter_banking_app/utils/size_config.dart';
import 'package:flutter_banking_app/utils/string.dart';
import 'package:flutter_banking_app/utils/styles.dart';
import 'package:flutter_banking_app/utils/values.dart';
import 'package:flutter_banking_app/widgets/appbar/my_app_bar.dart';
import 'package:flutter_banking_app/widgets/buttons.dart';
import 'package:flutter_banking_app/widgets/textfield/new_text_field.dart';
import 'package:flutter_banking_app/widgets/textfield/text_field.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  SharedPref sharedPref = SharedPref();
  User userLoad = User();
  Wallet wallet = Wallet();

  String? name,
      email,
      phone,
      branchId,
      emailVerifiedAt,
      smsVerifiedAt,
      countryCode;
  String? membershipId;

  FilePickerResult? result;
  PlatformFile? file;
  String fileType = 'All';

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    Widget fileDetails(PlatformFile file) {
      final kb = file.size / 1024;
      final mb = kb / 1024;
      final szize = (mb >= 1)
          ? '${mb.toStringAsFixed(2)} MB'
          : '${kb.toStringAsFixed(2)} KB';
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.file(
              File(file.path!),
              fit: BoxFit.cover,
              width: double.infinity,
              
              // height: 100,
            ),
            CircleAvatar(
                          backgroundImage: FileImage(file.path.toString()),
                          // backgroundImage: AssetImage(Values.userPath),
                          minRadius: 10,
                          maxRadius: 50,
                        ),
          ],
        ),
      );
    }

    void pickFiles(String? filetype) async {
      switch (filetype) {
        case 'Image':
          result = await FilePicker.platform.pickFiles(type: FileType.image);
          if (result == null) return;
          file = result!.files.first;
          setState(() {});
          break;
        case 'Video':
          result = await FilePicker.platform.pickFiles(type: FileType.video);
          if (result == null) return;
          file = result!.files.first;
          setState(() {});
          break;
        case 'Audio':
          result = await FilePicker.platform.pickFiles(type: FileType.audio);
          if (result == null) return;
          file = result!.files.first;
          setState(() {});
          break;
        case 'All':
          result = await FilePicker.platform.pickFiles();
          if (result == null) return;
          file = result!.files.first;
          setState(() {});
          break;
        case 'MultipleFile':
          result = await FilePicker.platform.pickFiles(allowMultiple: true);
          if (result == null) return;
          break;
      }
    }

    return Scaffold(
      backgroundColor: Styles.primaryColor,
      appBar: myAppBar(
        title: Str.editProfile,
        implyLeading: true,
        context: context,
      ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Container(
                      //   width: 100,
                      //   height: 100,
                      //   constraints:
                      //       const BoxConstraints(minWidth: 20, maxWidth: 100),
                        // child: CircleAvatar(
                        //   backgroundImage: NetworkImage(
                        //       userLoad.profilePicture ??
                        //           Values.userDefaultImage),
                        //   // backgroundImage: AssetImage(Values.userPath),
                        //   minRadius: 10,
                        //   maxRadius: 50,
                        // ),
                      // ),
                      Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15),
                            ),
                            color: Styles.cardColor,
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(7, 0, 0, 10),
                                child: Text(Str.profilePicture,
                                    style: Styles.primaryTitle),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  pickFiles('Image');
                                },
                                child: Text(Str.browse),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: Styles.accentColor,
                                ),
                              ),
                              if (file != null) fileDetails(file!),
                            ],
                          ),
                        ),
                      const Gap(20),
                      NewField(
                          readOnly: true,
                          initialValue: widget.user.memberId,
                          onSaved: (val) => membershipId = val,
                          hintText: Str.membershipId),
                      const Gap(20.0),
                      NewField(
                          initialValue: widget.user.name,
                          onSaved: (val) => name = val,
                          hintText: Str.name),
                      const Gap(20.0),
                      NewField(
                          initialValue: widget.user.email,
                          onSaved: (val) => email = val,
                          hintText: Str.email),
                      const Gap(20.0),
                      // NewField(
                      //     initialValue:
                      //         '${widget.user.countryCode}-${widget.user.phone}',
                      //     onSaved: (val) => phone = val,
                      //     hintText: Str.phoneNumber),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black12.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: CountryCodePicker(
                                onChanged: (value) {
                                  setState(() {
                                    countryCode = value.toString();
                                  });
                                },
                                onInit: (value) {
                                  countryCode = widget.user.countryCode;
                                },
                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: '+60',
                                // favorite: ['+60','MS'],
                                // optional. Shows only country name and flag
                                showCountryOnly: false,
                                // optional. Shows only country name and flag when popup is closed.
                                showOnlyCountryWhenClosed: false,
                                // optional. aligns the flag and the Text left
                                alignLeft: false,
                                padding: const EdgeInsets.all(12),
                                dialogSize: const Size(350, 450),
                                textStyle: GoogleFonts.nunitoSans(
                                  color: Styles.textColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFieldCustom(
                              initialValue: widget.user.phone,
                              onSaved: (value) => phone = value!,
                              hintText: Str.phoneNumber,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20.0),
                      // NewField(
                      //     initialValue: userLoad.branchId ?? 'Default',
                      //     onSaved: (val) => branchId = val,
                      //     hintText: Str.branch),
                      // const Gap(20.0),
                      elevatedButton(
                        color: Styles.secondaryColor,
                        context: context,
                        callback: () {},
                        text: Str.editProfile.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                const Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _innerContainer() {
    return ListView(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      constraints:
                          const BoxConstraints(minWidth: 20, maxWidth: 100),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            userLoad.profilePicture ?? Values.userDefaultImage),
                        // backgroundImage: AssetImage(Values.userPath),
                        minRadius: 10,
                        maxRadius: 50,
                      ),
                    ),

                    const Gap(20),
                    NewField(
                        readOnly: true,
                        initialValue: widget.user.memberId,
                        onSaved: (val) => membershipId = val,
                        hintText: Str.membershipId),
                    const Gap(20.0),
                    NewField(
                        initialValue: widget.user.name,
                        onSaved: (val) => name = val,
                        hintText: Str.name),
                    const Gap(20.0),
                    NewField(
                        initialValue: widget.user.email,
                        onSaved: (val) => email = val,
                        hintText: Str.email),
                    const Gap(20.0),
                    // NewField(
                    //     initialValue:
                    //         '${widget.user.countryCode}-${widget.user.phone}',
                    //     onSaved: (val) => phone = val,
                    //     hintText: Str.phoneNumber),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black12.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: CountryCodePicker(
                              onChanged: (value) {
                                setState(() {
                                  countryCode = value.toString();
                                });
                              },
                              onInit: (value) {
                                countryCode = widget.user.countryCode;
                              },
                              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                              initialSelection: '+60',
                              // favorite: ['+60','MS'],
                              // optional. Shows only country name and flag
                              showCountryOnly: false,
                              // optional. Shows only country name and flag when popup is closed.
                              showOnlyCountryWhenClosed: false,
                              // optional. aligns the flag and the Text left
                              alignLeft: false,
                              padding: const EdgeInsets.all(12),
                              dialogSize: const Size(350, 450),
                              textStyle: GoogleFonts.nunitoSans(
                                color: Styles.textColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFieldCustom(
                            initialValue: widget.user.phone,
                            onSaved: (value) => phone = value!,
                            hintText: Str.phoneNumber,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.phone,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20.0),
                    // NewField(
                    //     initialValue: userLoad.branchId ?? 'Default',
                    //     onSaved: (val) => branchId = val,
                    //     hintText: Str.branch),
                    // const Gap(20.0),
                    elevatedButton(
                      color: Styles.secondaryColor,
                      context: context,
                      callback: () {},
                      text: Str.editProfile.toUpperCase(),
                    ),
                  ],
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ],
    );
  }
}