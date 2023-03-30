import 'package:events/Services/auth_services.dart';
import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:events/widgets/security_question_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/login_signup_button.dart';

class SecurityQuestion extends StatefulWidget {
  static const routeName = 'SecurityQuestion';
  const SecurityQuestion(
      {super.key,
      required this.email,
      required this.password,
      required this.userName});
  final String email, password, userName;
  @override
  State<SecurityQuestion> createState() => _SecurityQuestionState();
}

class _SecurityQuestionState extends State<SecurityQuestion> {
  TextEditingController _answerTextController = TextEditingController();
  SecurityDropDown question_selected = new SecurityDropDown();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.1, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Please add a Security Question',
                style: appTheme().textTheme.headline3?.copyWith(
                    color: AppColors.colors.brown,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'It will help you in change password',
                style: appTheme().textTheme.headline3?.copyWith(
                    color: AppColors.colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 40,
              ),
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
                    labelText: 'Answer',
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
                      borderSide: BorderSide(color: AppColors.colors.darkShade),
                      borderRadius: BorderRadius.circular(10.0),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: LogInSignUpButton(
                  text: 'Signup',
                  isLogin: false,
                  onTap: () async {
                    print(question_selected.selectedQuestion);
                    print(_answerTextController.text);
                    await AuthService()
                        .registerUser(
                            context: context,
                            userName: widget.userName,
                            email: widget.email,
                            password: widget.password,
                            securityQuestion:
                                question_selected.selectedQuestion.toString(),
                            securityAnswer: _answerTextController.text)
                        .then((value) => {
                              Navigator.pushNamed(
                                  context, bottomnavigation_bar.routeName)
                            })
                        .onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                      throw Future.error(error!);
                    });
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
