import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecurityDropDown extends StatefulWidget {


  @override
  _SecurityDropDownState createState() => _SecurityDropDownState();

}
class _SecurityDropDownState extends State<SecurityDropDown> {
  String? selectedQuestion;
  List<String> questionList = <String>[
    "Where do you live?",
    "What is the name of your Crush?",
    "Which is your favourite Cuisine?",
    "Your Favorite Movie?"
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),

        filled: true,
        fillColor: AppColors.colors.lightestShade,
      ),

      hint: Text(
        'Select Security Question',
        style: appTheme().textTheme.headline3?.copyWith(
          color: AppColors.colors.grey,
          fontSize: 18,
        ),
      ),
      isExpanded: true,
      value: selectedQuestion,
      items: questionList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      onChanged: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {
          selectedQuestion = _!;
        });
      },
    );
  }
}