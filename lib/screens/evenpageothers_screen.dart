import 'package:events/screens/bottomNavgation_bar.dart';
import 'package:flutter/material.dart';


class eventPageothers extends StatelessWidget {
  const eventPageothers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            bottom: PreferredSize(

              preferredSize: Size.fromHeight(0),
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              height: 30,
              width: double.infinity,
              child: SizedBox(),
            ),),
            title: Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: Icon(Icons.arrow_back,color: Colors.white,),
                  )
                ],
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/images/anime.jpg",fit: BoxFit.cover,),
            ),

          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(

                        children: [   Text("Naruto",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],),
                      SizedBox(height: 10,),
                      Row(

                        children: [   Text("Category: Adventure")],),
                      SizedBox(height: 5,),
                      Row(

                        children: [   Text("Date: 22/01/2023")],),
                      SizedBox(height: 10,),
                      Row(

                        children: [   Text("Venue: Building Block 5, Hidden Leaf,\n Fire content, 475788")],),
                      SizedBox(height: 20,),
                      Text("Naruto is a Japanese manga series written and illustrated by Masashi Kishimoto. A young ninja who seeks recognition from his peers and dreams of becoming the Hokage, the leader of his village. Naruto is generally a very simple minded, easy going, cheerful person. He often rushes things, and misses obvious things.")
                      ,SizedBox(height: 20,),
                      Row(

                        children: [   Text("Hosted By: Kishimito")],),
                      SizedBox(height: 20,),

                      Row(

                        children: [   Text("Connect to Host:")],),
                      SizedBox(height: 5,),
                      Row(

                        children: [   Text("kishimito12@gmail.com")],),
                      SizedBox(height: 30,),
                      Row(

                        children: [   Text("It’s Free Event!!!")],),
                      SizedBox(height: 200,)


                    ],
                  ),
                  Positioned(
                    bottom: 400,
                    child: Container(
                      color: Colors.white.withOpacity(0.7),
                      width: 600,
                      child: Row(
                        children: [
                          TextButton(onPressed: (){}, child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text("hi"),
                          ),style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)
                                  )
                              )
                          )),
                          SizedBox(width: 100,),
                          TextButton(onPressed: (){}, child:Text("hi"),style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(width:5,color: Colors.red)
                                  )
                              )
                          )),
                        ],
                      ),
                    ),
                  )
                ],

              ),
            ),
          ),

        ],
      ),

    );
  }
}
