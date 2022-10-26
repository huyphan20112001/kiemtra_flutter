import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String src = "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80";
  final Color blue = Colors.blueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FractionallySizedBox(
          widthFactor: 1.0,
          child: Column(
            children:  [
              Image.network(src),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Oeschinen Lake Campground",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                          'Kanderstag, Switzeland',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.deepOrange,),
                      Text("41", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,

                      ),)
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Icon(Icons.call, color: blue,),
                      Text("CALL", style: TextStyle(
                        color: blue,
                      ),),

                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.send, color: blue,),
                      Text("ROUTE", style: TextStyle(
                        color: blue,
                      ),),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.share, color: blue,),
                      Text("SHARE", style: TextStyle(
                        color: blue,
                      ),),
                    ],
                  )
                ],
              ),
              Text("The time had come for Nancy to say goodbye. She had been dreading this moment for a good six months, and it had finally arrived despite her best efforts to forestall it. No matter how hard she tried, she couldn't keep the inevitable from happening. So the time had come for a normal person to say goodbye and move on. It was at this moment that Nancy decided not to be a normal person. After all the time and effort she had expended, she couldn't bring herself to do it.")
              

            ],
          ),
        ),
      ),
    );
  }
}
