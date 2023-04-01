import 'package:events/constants/colors.dart';
import 'package:events/widgets/basic_text_field.dart';
import 'package:events/widgets/custom_dropdown.dart';
import 'package:events/widgets/login_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  TextEditingController eventName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController date = TextEditingController();
  CustomDropDown categorySelected = CustomDropDown(options: <String>["Entertainment","Technology"]);
  bool isFree = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.colors.lightShade,
          title: Text('Evento'),
          centerTitle: true,
          flexibleSpace: Container(
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.colors.midShade,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            iconSize: 30,
            onPressed: () {

            },
          ),
          ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 220,
                      width: 165,
                      decoration: BoxDecoration(
                        color:AppColors.colors.lightestGrey,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.add),
                          color: AppColors.colors.midShade,
                          iconSize: 50,
                          onPressed: () {

                          },
                        ),
                      ),
                    ),
                  ),
                  CustomTextField(controller:eventName,label: 'Enter Event Name'),
                  categorySelected,
                  CustomTextField(controller: address, label: 'Add Address'),
                  CustomTextField(controller: date, label: 'Select Date'),
                  CustomTextField(controller: description, label: 'Add Description',lines: 3,),
                  Row(
                    children: [
                      Container(
                        width: 220,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.colors.lightestShade,

                        ),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Is Free',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight:FontWeight.w400,
                              color: AppColors.colors.grey
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Switch(
                          inactiveTrackColor: AppColors.colors.lightestGrey,
                          inactiveThumbColor: AppColors.colors.grey,
                          activeColor: AppColors.colors.green,
                          activeTrackColor: AppColors.colors.lightestGrey,
                          onChanged: ((value) async => {
                            setState(() => {isFree = value}),
                          }),
                          value: isFree,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: LogInSignUpButton(text: '    Set    ', isLogin: false, onTap: (){

                    }),
                  )
                ],
              ),
            ),
          ),
        );
  }
}
