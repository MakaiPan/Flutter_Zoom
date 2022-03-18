import 'package:flutter/material.dart';

class JoinScreen extends StatefulWidget {
  static const id = 'join_screen';

  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80.0,
        leading: TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Join Meeting',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
