import 'dart:io';
import 'package:events/Services/event_services.dart';
import 'package:events/provider/userProvider.dart';
import 'package:events/screens/home_wrapper.dart';
import 'package:intl/intl.dart';
import 'package:events/constants/colors.dart';
import 'package:events/widgets/basic_text_field.dart';
import 'package:events/widgets/custom_dropdown.dart';
import 'package:events/widgets/login_signup_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../Services/image_picker.dart';
import '../../constants/theme.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({Key? key}) : super(key: key);

  static const String routeName ="AddEvent";

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  TextEditingController eventName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  CustomDropDown categorySelected =
      CustomDropDown(options: <String>["Entertainment", "Technology","Other"],title: "Select Category",);
  bool isFree = true;
  File? img;
  String date='',photoUrl='';
  DateTime oldDate = DateTime.now();

  Future pickImage() async {
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 25);
      if (image == null) return;
      final imageTemp = File(image.path);

      setState(() {
        img = imageTemp;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pickimage : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colors.white,
        elevation: 0,
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
          onPressed: () {},
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
                      color: AppColors.colors.lightestGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: img != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            File(img!.path),
                            fit: BoxFit.cover,
                            height: 220,
                            width: 165,
                          ),
                        )
                      : Center(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: AppColors.colors.midShade,
                            iconSize: 50,
                            onPressed: () {
                              pickImage();
                            },
                          ),
                        ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              img != null
                  ? Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.pencil,
                          color: AppColors.colors.grey,
                        ),
                        TextButton(
                            onPressed: () {
                              pickImage();
                            },
                            child: Text(
                              'Retake',
                              style: appTheme().textTheme.headline3?.copyWith(
                                  color: AppColors.colors.grey, fontSize: 20),
                            )),
                      ],
                    )
                  : SizedBox(),
              CustomTextField(controller: eventName, label: 'Enter Event Name'),
              categorySelected,
              CustomTextField(controller: address, label: 'Add Address'),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.colors.lightestShade,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  child: Text(date != '' ? date.toString() : 'Selcet Date',
                      style: appTheme().textTheme.headline3),
                  onPressed: () async {
                    //TODO change the datePicker no selection of past date and no selectionn of date 1 month later
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: oldDate != null ? oldDate : DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (pickedDate != null) {
                      setState(() {
                        oldDate = pickedDate;
                        String dateformat =
                            DateFormat('dd-MM-yyyy').format(pickedDate);
                        // print(dateformat);
                        date = dateformat;
                      });
                    }
                  },
                ),
              ),
              CustomTextField(
                controller: description,
                label: 'Add Description',
                lines: 3,
              ),
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
                      child: Text('Is Free',
                          style: appTheme().textTheme.headline3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 15),
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 20),
                child: LogInSignUpButton(
                    text: '    Set    ',
                    isLogin: false,
                    onTap: () async {
                      photoUrl = await uploadFile(img, 'event',fileName: DateTime.now().toString());
                      await EventServices().createEvent(
                          context: context,
                          eventName: eventName.text,
                          hostEmail: Provider.of<UserProvider>(context,listen: false).getUserEmail(),
                          category: categorySelected.selected.toString(),
                          address: address.text,
                          eventDateTime: date,
                          eventStatus: 'upcoming',
                          eventPhoto: photoUrl,
                          eventDescription: description.text.trim(),
                          isFree: isFree.toString());
                      Navigator.pushNamedAndRemoveUntil(context,HomeWrapper.routeName, (route) => false);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
