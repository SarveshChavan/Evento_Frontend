import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFeeedf2),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
            height: 30,
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    child: Text(
                      "My Profile",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Gap(30),
              Center(
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: AssetImage("assets/Kunal_Patil.jpg"),
                ),
              ),
              Gap(20),
              Text(
                "Kunal Patil",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Gap(30),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Number of events Register till date:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade400),
                    ),
                    Gap(10),
                    Text(
                      "10",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Gap(30),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black54,
                        ),
                        Gap(10),
                        Text("abhishekbhadane838@gmail.com",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Gap(50),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          color: Colors.black54,
                        ),
                        Gap(10),
                        Text("+91-8380938538",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Gap(50),
                    Row(
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.black54,
                        ),
                        Gap(10),
                        Text("Settings",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500))
                      ],
                    ),
                    Gap(50),
                    Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black54,
                        ),
                        Gap(10),
                        Text("Logout",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
