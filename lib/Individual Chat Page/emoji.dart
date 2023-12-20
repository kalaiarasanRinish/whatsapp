import 'dart:io' show Platform; // Import Platform from dart:io
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class EmojiPickerWidget extends StatefulWidget {
  const EmojiPickerWidget({Key? key}) : super(key: key);

  @override
  State<EmojiPickerWidget> createState() => _EmojiPickerWidgetState();
}
bool showEmoji = false;
class _EmojiPickerWidgetState extends State<EmojiPickerWidget> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emoji Picker'),
      ),
      body: SizedBox(
        height: 35,
        // width: 30,
        child: EmojiPicker(
          textEditingController: _textEditingController,
          config: Config(
            columns: 7,
            emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0), // Use Platform.isIOS instead of Platform.iOS
          ),
        ),
      ),
    );
  }
}






