import 'package:flutter/material.dart';

import '../model/cameraPage.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.groups,
            size: 200.0,
            color: Colors.green, // Choose a color that fits your design
          ),
          SizedBox(height: 10.0),
         Text(
            "Stay Connected With a Community",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        SizedBox(height: 10.0),
           Text(
            "Communities bring members together in "
                "topic-based groups and make it easy to get admin "
                "announcements. Any community you're added to will "
                "appear here.",
            textAlign: TextAlign.center,
          ),
         SizedBox(height: 20.0), // Add some space before the button
          TextButton(
            onPressed: () {
              // Add your logic for the button press
              print("Join Community button pressed!");
            },
            child:  Text(
              "See example Communities >",
              style: TextStyle(
                color: Color.fromRGBO(0,128,105,1)

                // fontSize: 14.0,
              ),
            ),
          ),

          InkWell(
            child: const Text('Start your community'),
            

          )
        ],

      ),

    );
  }
}
