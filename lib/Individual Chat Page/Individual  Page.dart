import 'package:flutter/material.dart';

import '../model/cameraPage.dart';
import 'emoji.dart';

class IndividualPage extends StatefulWidget {
  final String dp;
  final String userName;
  final String lastSeen;

  const IndividualPage({
    Key? key,
    required this.dp,
    required this.userName,
    required this.lastSeen,
  }) : super(key: key);

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class Message {
  final String text;
  final bool isSelf;

  Message({required this.text, required this.isSelf});
}

class _IndividualPageState extends State<IndividualPage> {
  final textController = TextEditingController();
  final List<Message> messages = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          leadingWidth: 70.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.dp),
                radius: 20.0,
                backgroundColor: Colors.blueGrey,
              ),
              SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.lastSeen,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          centerTitle: false,
          titleSpacing: 0,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("media, links, and docs"),
                    value: "media, links, and docs",
                  ),
                  PopupMenuItem(child: Text("Search"), value: "Search"),
                  PopupMenuItem(
                    child: Text("Mute notification"),
                    value: "Mute notification",
                  ),
                  PopupMenuItem(
                    child: Text("Disappearing messages"),
                    value: "Disappearing messages",
                  ),
                  PopupMenuItem(child: Text("Wallpaper"), value: "Wallpaper"),
                  PopupMenuItem(child: Text("More"), value: "More"),
                ];
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageWidget(messages[index]);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        prefixIcon: IconButton(
                          onPressed: () {
                            showEmoji = !showEmoji;

                          },
                          icon: Icon(Icons.emoji_emotions),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                bottemsheet();

                              },
                              icon: Icon(Icons.attach_file_rounded),
                            ),
                            IconButton(
                              onPressed: () {
                                // Handle attach file icon press
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));

                              },
                              icon: Icon(Icons.camera_alt),

                            ),
                          ],
                        ),

                      ),
                    ),
                  ),
                  SizedBox( width: 10),
                  GestureDetector(
                      onTap: _sendMessage,
                    child: Container(
                      padding: EdgeInsets.all(10),

                      decoration: BoxDecoration(

                        shape: BoxShape.circle,


                        color: Color.fromRGBO(0, 128, 105, 1),

                      ),

                      child: Icon(

                        Icons.send_sharp,
                        size: 27,color: Colors.white,),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottemsheet() {
    return Container(
      height: 278,
      width: 350,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 30,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink.shade400, "Camera"),
                  SizedBox(
                    width: 30,
                  ),
                  iconcreation(Icons.image, Colors.purple.shade400, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.deepOrange, "Audio"),
                  SizedBox(
                    width: 30,
                  ),
                  iconcreation(Icons.location_pin, Colors.green.shade500, "Location"),
                  SizedBox(
                    width: 30,
                  ),
                  iconcreation(Icons.person, Colors.blue, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String newMessage = textController.text;
    if (newMessage.isNotEmpty) {
      setState(() {
        messages.add(Message(text: newMessage, isSelf: true));
      });
      textController.clear();
    }
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      alignment: message.isSelf ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: message.isSelf ? Colors.lightGreen.shade300 : Colors.grey,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(10.0),
        child: Text(
          message.text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }


}