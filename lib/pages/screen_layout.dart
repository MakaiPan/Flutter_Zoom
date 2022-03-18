import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/meet_and_chat/meet_and_chat_page.dart';
import 'package:zoom_clone/utils/colors.dart';

List<Widget> screenList = [
  const MeetAndChatPage(),
  const Center(child: Text('Meeting')),
  const Center(child: Text('Contacts')),
  const Center(child: Text('Settings')),
];

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({Key? key}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _currentPageIndex = 0;
  onPageChanged(int selectedPageIndex) {
    setState(() {
      _currentPageIndex = selectedPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      body: screenList[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kFooterColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentPageIndex,
        onTap: onPageChanged,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
