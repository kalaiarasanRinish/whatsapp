import 'package:flutter/material.dart';
import 'package:whatsapp/model/Chat_model.dart';

// import '../ Individual Chat Page/Individual  Page.dart';
import 'package:whatsapp/Individual Chat Page/Individual  Page.dart';
class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);


@override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) {
       return ListTile(
          onTap: () {
            Navigator.push(
                context,MaterialPageRoute(builder: (context)=>IndividualPage(dp: chatsData[index].pic, userName: chatsData[index].name,lastSeen: chatsDatas[index].lastSeen ))
            );
            // Handle the chat item tap
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(chatsData[index].pic),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chatsData[index].name,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
              Text(
                chatsData[index].time,
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey,
                ),
              ),

            ],
          ),
          subtitle: Text(
            chatsData[index].msg,
            style: TextStyle(color: Colors.grey, fontSize: 17.0),
          ),
        );
      },
    );
  }
}
