import 'dart:io';
import 'package:events/Services/auth_services.dart';
import 'package:events/constants/handler.dart';
import 'package:events/widgets/custom_shape_profile.dart';
import 'package:events/widgets/security_question_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/theme.dart';
import '../../models/user.dart';
import '../../provider/userProvider.dart';
import '../../widgets/login_signup_button.dart';

class ChangePassword extends StatefulWidget {
  static const routeName = "ChangePassword";
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late double width;
  late String userName;
  late String userEmail;
  late String photoUrl;
  TextEditingController _answerTextController = TextEditingController();
  TextEditingController _newPassTextController = TextEditingController();
  SecurityDropDown question_selected = new SecurityDropDown();
  bool isCorrect = false;
  EventoUser user = EventoUser();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      user = Provider.of<UserProvider>(context, listen: false).getUser();
      photoUrl = user.profilePhoto == "" ? photoUrl : user.profilePhoto!;
      userName = user.userName!;
      userEmail = user.email!;
      userName = user.userName!;
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colors.lightShade,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomShapeProfile(
              width: width,
              userName: userName,
              photoUrl: photoUrl,
              isProfilePhotoChange: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 20),
              child: Text(
                'Change Password',
                style: appTheme()
                    .textTheme
                    .headline3
                    ?.copyWith(fontSize: 20, color: AppColors().brown),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  question_selected,
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _answerTextController,
                    cursorColor: AppColors.colors.grey,
                    style: TextStyle(
                      color: AppColors.colors.grey,
                    ),
                    decoration: InputDecoration(
                        focusColor: AppColors.colors.midDarkShade,
                        labelText: 'Add Answer',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        labelStyle: TextStyle(
                          color: AppColors.colors.grey,
                        ),
                        filled: true,
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: AppColors.colors.lightestShade,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.colors.darkShade),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: LogInSignUpButton(
                      text: 'Check',
                      isLogin: false,
                      onTap: () {
                        if (question_selected.selectedQuestion.toString() ==
                                user.securityQuestion &&
                            _answerTextController.text == user.securityAnswer) {
                          setState(() {
                            isCorrect = true;
                          });
                        } else {
                          showSnackBar(context, 'Wrong Details', true);
                        }
                      },
                    ),
                  ),
                  TextField(
                    controller: _newPassTextController,
                    cursorColor: AppColors.colors.grey,
                    style: TextStyle(
                      color: AppColors.colors.grey,
                    ),
                    decoration: InputDecoration(
                        focusColor: AppColors.colors.midDarkShade,
                        labelText: 'New Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        enabled: isCorrect,
                        labelStyle: TextStyle(
                          color: isCorrect
                              ? AppColors.colors.midShade
                              : AppColors.colors.grey,
                        ),
                        filled: true,
                        // floatingLabelBehavior: FloatingLabelBehavior.never,
                        fillColor: AppColors.colors.lightestGrey,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.colors.darkShade),
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: LogInSignUpButton(
                      text: 'Change',
                      isLogin: false,
                      onTap: isCorrect
                          ? () async {
                              AuthService().changePassword(
                                  context: context,
                                  email: userEmail,
                                  securityQuestion: question_selected
                                      .selectedQuestion
                                      .toString(),
                                  securityAnswer: _answerTextController.text,
                                  newPassword: _newPassTextController.text);
                            }
                          : () {},
                      buttonColor: isCorrect
                          ? const Color(0xFFFF7272)
                          : const Color(0xFF7C7C7C),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Copyrights are reserved ",
                            style: appTheme().textTheme.headline3?.copyWith(
                                  fontSize: 16,
                                )),
                        Text("@Evento",
                            style: appTheme().textTheme.headline3?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors().brown))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
