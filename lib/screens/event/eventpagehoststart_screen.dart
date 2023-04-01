// import 'dart:html';

import 'package:flutter/material.dart';

class HostEventPage extends StatefulWidget {
  const HostEventPage({Key? key}) : super(key: key);
  static const String routeName = "eventPagehHost";
  @override
  State<HostEventPage> createState() => _HostEventPageState();
}

class _HostEventPageState extends State<HostEventPage> {
  String hostEmail="";
  String category="Adventure";
  String eventName="Naruto";
  String address="Building Block 5, Hidden Leaf,\n Fire content, 475788";
  bool isFree=true;
  String eventDateTime="22/01/2023";
  String eventStatus="ongoing";
  String eventPhoto="assets/images/anime.jpg";
  String eventDescription="";
  bool startevent = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        padding: EdgeInsets.only(left: 14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (startevent == false)
              FloatingActionButton.extended(
                backgroundColor: Colors.green,
                onPressed: () {
                  setState(() {
                    startevent = true;
                  });
                },
                label: Container(
                    padding: EdgeInsets.all(20), child: Text("Start")),
              ),
            FloatingActionButton.extended(
                backgroundColor: Colors.red,
                onPressed: () {},
                label:
                    Container(padding: EdgeInsets.all(20), child: Text("End"))),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  image: DecorationImage(
                      image: AssetImage("assets/images/anime.jpg"),
                      fit: BoxFit.cover)),
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Naruto",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Category: Adventure"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Date: 22/01/2023"),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Venue: Building Block 5, Hidden Leaf,\n Fire content, 475788"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. A young ninja who seeks recognition Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. A young ninja who seeks recognition Naruto is a Japanese manga series written and illustrated by Masashi Naruto is a Japanese manga series written and illustrated by MasashiNaruto is a Japanese manga series written and illustrated by Masashi Kishimoto. A young ninja who seeks recognition  Kishimoto. A young ninja who seeks recognition Kishimoto. A young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. Naruto is generally a very simple minded, easy going, cheerful person. He often rushes things, and misses obvious things."),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Hosted By: Kishimito"),
                  SizedBox(
                    height: 20,
                  ),

                  Text("Connect to Host:"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("kishimito12@gmail.com"),
                  SizedBox(
                    height: 30,
                  ),
                  Text("It’s Free Event!!!"),
                  // SizedBox(height: 200,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
