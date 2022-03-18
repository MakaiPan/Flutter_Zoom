import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/utils/constants.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.maxLength,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? hintText;
  final String? initialValue;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: controller,
        minLines: 1,
        textAlign: TextAlign.center,
        keyboardType: keyboardType,
        maxLength: maxLength,
        decoration: InputDecoration(
          fillColor: kSecondaryBackgroundColor,
          filled: true,
          border: InputBorder.none,
          hintText: hintText,
          suffix: controller != null && controller!.text.isNotEmpty
              ? clearInput()
              : null,
          counterText: '',
        ),
      ),
    );
  }

  Widget clearInput() {
    return GestureDetector(
      child: const Icon(
        Icons.cancel,
        size: 14.0,
      ),
      onTap: () {
        controller!.text = '';
      },
    );
  }
}
