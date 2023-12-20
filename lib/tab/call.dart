import 'package:flutter/material.dart';
import 'package:whatsapp/model/call_model.dart';

class Call extends StatelessWidget {
  const Call({Key? key});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) => new Column(
          children: [
            new Divider(
              height: 0.1,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(callData[i].pic),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  new Text(
                    callData[i].name,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  new Icon(
                    i % 2 == 0 ? Icons.call : Icons.videocam,
                    color:  Color.fromRGBO(0,128,105,1),
                  ),

                ],
              ),
              subtitle: Row(

                children: [
                  Icon(
                    Icons.arrow_downward_rounded,
                    size: 16.0,
                    color: Colors.grey,
                  ),
                  Text(
                    callData[i].time,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
