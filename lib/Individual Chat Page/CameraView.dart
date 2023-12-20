import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatefulWidget {
  const CameraViewPage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  State<CameraViewPage> createState() => _CameraViewPageState();
}

class _CameraViewPageState extends State<CameraViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate, size: 27, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.emoji_emotions_outlined, size: 27, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.title, size: 27, color: Colors.white)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 27, color: Colors.white)),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 150,

          child: Image.file(
            File(widget.path), // Access the path through widget.path
            fit: BoxFit.cover,
          ),

      ),
      // TextFormField()


    );
  }
}
