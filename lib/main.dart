import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/meet_and_chat/screens/join/join_screen.dart';
import 'package:zoom_clone/utils/auth.dart';
import 'package:zoom_clone/pages/login/login_page.dart';
import 'package:zoom_clone/pages/meet_and_chat/meet_and_chat_page.dart';
import 'package:zoom_clone/pages/screen_layout.dart';
import 'package:zoom_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        MeetAndChatPage.id: (context) => const MeetAndChatPage(),
        JoinScreen.id: (context) => const JoinScreen(),
      },
      home: StreamBuilder(
        stream: Auth().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return const ScreenLayout();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
