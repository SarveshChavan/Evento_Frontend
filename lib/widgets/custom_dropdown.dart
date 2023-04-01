import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {

  CustomDropDown({ required this.options});

  List<String> options;
  String? selected;
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}
class _CustomDropDownState extends State<CustomDropDown> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20 ),
      child: DropdownButtonFormField<String>(
        dropdownColor: AppColors.colors.lightestShade,
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
        value: widget.selected,
        items: widget.options.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:TextStyle(
                color: AppColors.colors.grey
              ),
            ),
          );
        }).toList(),
        onChanged: (val) {
          FocusScope.of(context).requestFocus(FocusNode());
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            widget.selected = val!;
          });
        },
      ),
    );
  }
}