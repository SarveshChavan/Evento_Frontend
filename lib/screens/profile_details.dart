import 'dart:io';
import 'package:events/constants/colors.dart';
import 'package:events/constants/theme.dart';
import 'package:events/screens/custom_shape.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetails extends StatefulWidget {
  static const routeName = "ProfileDetails";
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  late double width, height;
  String userName = 'Red Hair Shanks';
  String photoUrl = 'https://avatarfiles.alphacoders.com/206/thumb-206822.jpg';
  String bio='ADD BIO';
  String tempBio='';
  String userEmail='abc@gmail.com';
  bool isMale=true;
  File ?img;
  int eventCount=3;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
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
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colors.lightShade,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                CustomShape(),
                Positioned(
                  left: 1.19 * width / 4,
                  top: 0,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade50,
                        radius: 80,
                        child: CircleAvatar(
                          radius: 70,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                              child: img==null?Image(image: NetworkImage(photoUrl)):Image.file(
                                File(img!.path),
                                fit: BoxFit.cover,
                                height: 140,
                                width: 140,
                              )),
                        ),
                      ),
                      Positioned(
                          left: 120,
                          top: 120,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: IconButton(
                              onPressed: () {
                                pickImage();
                              },
                              icon: Icon(
                                Icons.add_a_photo_outlined,
                                color: AppColors.colors.brown,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userName,
                  style: appTheme().textTheme.headline2,
                ),
              ],
            ),

            Center(
              child: Text('Events: $eventCount',  style: appTheme().textTheme.headline3?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors().brown)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
              child:MaterialButton(
                minWidth: double.infinity,
                height: 47,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0)), //this right here
                          child: SizedBox(
                            height: 230,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 12,bottom: 5,left: 20,right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextField(
                                    minLines: 1,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.colors.white,
                                      hintText: 'Tell us bit about yourself... ',
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: Colors.transparent),
                                      ).copyWith(
                                          borderRadius: BorderRadius.circular(8)),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 0,
                                            color: Colors.transparent),
                                      ).copyWith(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        tempBio=value!.trim();
                                      });
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if(tempBio!='') {
                                            bio=tempBio;
                                          }
                                          tempBio='';
                                        });
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:AppColors.colors.lightShade,
                                          padding: const EdgeInsets.symmetric(horizontal: 30)
                                      ),
                                      child: Text('Enter',style: appTheme().textTheme.headline4?.copyWith(color: AppColors().midDarkShade,fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                color: AppColors.colors.lightestShade,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: bio=='ADD BIO'? Text(
                  'ADD BIO',
                  style: appTheme().textTheme.headline3?.copyWith(color: AppColors().midDarkShade,fontWeight: FontWeight.w600),
                ):Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: AppColors.colors.lightestShade,
                  ),
                  child: Text(bio,style: appTheme().textTheme.headline3?.copyWith(color: AppColors().midDarkShade,fontWeight: FontWeight.w600)),
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33),
              child: ListTile(
                leading: Icon(CupertinoIcons.mail_solid,color: AppColors.colors.midShade,),
                title: Text(userEmail,style: appTheme().textTheme.headline5?.copyWith(color: AppColors.colors.grey)),
                tileColor: AppColors.colors.lightestShade,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 33,vertical: 20),
              child: ListTile(
                leading: Icon(CupertinoIcons.lock_fill,color: AppColors.colors.midShade,),
                title: Text('Change Password',style: appTheme().textTheme.headline5?.copyWith(color: AppColors.colors.grey)),
                trailing: Icon(CupertinoIcons.arrow_right,color: AppColors.colors.midShade,),
                tileColor: AppColors.colors.lightestShade,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                onTap: (){
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Copyrights are reserved ",
                      style: appTheme().textTheme.headline3?.copyWith(
                        fontSize: 16,
                      )
                  ),
                  Text(
                      "@Evento",
                      style: appTheme().textTheme.headline3?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors().brown
                      )
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
