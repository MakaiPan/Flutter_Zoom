import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/auth.dart';
import 'package:zoom_clone/utils/constants.dart';
import 'package:zoom_clone/utils/extension.dart';
import 'package:zoom_clone/utils/jitsi.dart';
import 'package:zoom_clone/widgets/custom_button.dart';
import 'package:zoom_clone/widgets/intpu_text_field.dart';

class JoinScreen extends StatefulWidget {
  static const id = 'join_screen';

  const JoinScreen({Key? key}) : super(key: key);

  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  late TextEditingController _meetingIdController;
  late TextEditingController _nameController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _meetingIdController = TextEditingController()
      ..addListener(() => setState(() {}));
    _nameController = TextEditingController()
      ..addListener(() => setState(() {}))
      ..text = Auth().user.displayName ?? '';
  }

  @override
  void dispose() {
    _meetingIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leadingWidth: 80.0,
        leading: TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
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
      body: Column(
        children: [
          InputTextField(
            controller: _meetingIdController,
            maxLength: kMaxMeetingIdLength,
            keyboardType: TextInputType.number,
            hintText: 'Meeting ID',
          ),
          const SizedBox(height: 24.0),
          InputTextField(
            controller: _nameController,
            hintText: 'Screen Name',
          ),
          const SizedBox(height: 8.0),
          CustomButton(
            text: 'Join',
            onPressed:
                (_meetingIdController.text.length != kMaxMeetingIdLength) ||
                        _nameController.text.isEmpty
                    ? null
                    : _joinMeeting,
          ),
        ],
      ),
    );
  }

  void _joinMeeting() {
    Jitsi().createMeeting(
      roomName: _meetingIdController.text,
      isAudioMuted: true,
      isVideoMuted: true,
      username: _nameController.text,
    );
  }
}
