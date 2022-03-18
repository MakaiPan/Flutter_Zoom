import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class CustonButton extends StatelessWidget {
  const CustonButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: kButtonColor,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(color: kButtonColor),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
