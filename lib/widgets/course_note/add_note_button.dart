import 'package:flutter/material.dart';

import '../../keys/string_key.dart';
import '../../utils/translations.dart';
import '../ui/button/raised_button_colored.dart';

class AddNoteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddNoteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: RaisedButtonColored(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        text: i18n.text(StrKey.ADD_NOTE_BTN),
        onPressed: onPressed,
      ),
    );
  }
}
