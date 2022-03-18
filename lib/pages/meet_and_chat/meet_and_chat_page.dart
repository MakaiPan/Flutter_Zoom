import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/meet_and_chat/components/meeting_button.dart';
import 'package:zoom_clone/pages/meet_and_chat/screens/join/join_screen.dart';
import 'package:zoom_clone/utils/jitsi.dart';

class MeetAndChatPage extends StatefulWidget {
  static const id = 'meet_and_chat_screen';
  const MeetAndChatPage({Key? key}) : super(key: key);

  @override
  State<MeetAndChatPage> createState() => _MeetAndChatPageState();
}

class _MeetAndChatPageState extends State<MeetAndChatPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MeetingButton(
              icon: Icons.videocam,
              text: 'New Meeting',
              onPressed: () async {
                String roomName =
                    (Random().nextInt(10000000) + 10000000).toString();
                await Jitsi().createMeeting(
                    roomName: roomName, isAudioMuted: true, isVideoMuted: true);
              },
            ),
            MeetingButton(
              icon: Icons.add_box_rounded,
              text: 'Join',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const JoinScreen(),
                  ),
                );
              },
            ),
            MeetingButton(
              icon: Icons.calendar_today,
              text: 'Schedule',
              onPressed: () {},
            ),
            MeetingButton(
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
              onPressed: () {},
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Create/Join Meeting with just a click!',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
