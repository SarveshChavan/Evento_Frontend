import 'package:flutter/material.dart';
import 'package:events/constants/colors.dart';
import 'custom_alert_button.dart';

// showDialog(
//     context: context,
//     builder: (BuildContext context){
//       return CustomFrame(title: 'Cancelling this ride',description: 'You have almost finished booking your ride. Do you really want to cancel your ride ?',);
//     });

// ignore: must_be_immutable
class CustomFrame extends StatelessWidget {
  CustomFrame({
    required this.title,
    required this.description,
    this.button1Text = 'No',
    this.button2Text = 'Yes',
    this.button1Need = false,
    required this.function,
    Key? key,
  }) : super(key: key);

  String title, description, button1Text, button2Text;
  bool button1Need;
  void Function() function;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.centerLeft,
      titlePadding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.colors.black),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          description,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            button1Need == true
                ? Expanded(
                    flex: 1,
                    child: AlertButtton(
                      function: () {
                        Navigator.pop(context);
                      },
                      text: button1Text,
                    ))
                : Expanded(
                    child: SizedBox(),
                    flex: 1,
                  ),
            Expanded(
                flex: 1,
                child: AlertButtton(
                  function: function,
                  text: button2Text,
                  textColor: AppColors.colors.white,
                  buttonColor: AppColors.colors.midShade,
                  borderColor: AppColors.colors.midShade,
                )),
          ],
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
