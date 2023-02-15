import 'package:flutter/material.dart';
class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(

          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff65799b), Color(0xff5e2563)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage('https://wallpaperaccess.com/full/640380.jpg'),
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '17/02/2023',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200,
                          child: Text(
                            'Guest Lecture by Pravin Harne from VIT',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white)
                        ),
                        onPressed: (){},
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff5e2563)
                          ),
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
