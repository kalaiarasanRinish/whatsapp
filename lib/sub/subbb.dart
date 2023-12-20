//
// import 'package:flutter/material.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<Message> messages = [];
//   final TextEditingController _textController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 return MessageWidget(messages[index]);
//               },
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMessageInput() {
//     return Padding(
//
//       padding: const EdgeInsets.all(8.0),
//       child: Form(
//
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: TextFormField(
//                 controller: _textController,
//                 decoration: InputDecoration(
//                   hintText: 'Type your message...',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(50.0),
//                   ),
//                   suffixIcon: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           // Navigator.push(context, MaterialPageRoute(builder:(context) => const  bottemsheet() ));
//
//                         },
//                         icon: Icon(Icons.attach_file_rounded),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           // Handle attach file icon press
//                           // Navigator.push(context, MaterialPageRoute(builder: (context)=> const CameraPage()));
//                           Navigator.push(context, MaterialPageRoute(builder:(context) => const ChatScreen() ));
//                         },
//                         icon: Icon(Icons.camera_alt),
//
//                       ),
//                     ],
//                   ),
//
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.send),
//               onPressed: () {
//                 _sendMessage();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _sendMessage() {
//     String newMessage = _textController.text;
//     if (newMessage.isNotEmpty) {
//       setState(() {
//         messages.add(Message(text: newMessage, isSelf: true));
//         // Simulate a reply for demonstration purposes
//       });
//       // Clear the input field
//       _textController.clear();
//     }
//   }
// }
//
//
//
// class Message {
//   final String text;
//   final bool isSelf;
//
//   Message({required this.text, required this.isSelf});
// }
//
// class MessageWidget extends StatelessWidget {
//   final Message message;
//
//   MessageWidget(this.message);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//       alignment: message.isSelf ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         decoration: BoxDecoration(
//           color: message.isSelf ? Colors.lightGreen.shade300 : Colors.grey,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         padding: EdgeInsets.all(10.0),
//         child: Text(
//           message.text,
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
