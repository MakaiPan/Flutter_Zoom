import 'package:flutter/material.dart';
import 'package:zoom_clone/screens/home/components/meeting_button.dart';
import 'package:zoom_clone/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Column(
        children: [
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MeetingButton(
                icon: Icons.videocam,
                text: 'New Meeting',
                onPressed: () {},
              ),
              MeetingButton(
                icon: Icons.add_box_rounded,
                text: 'Join',
                onPressed: () {},
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
      ),
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
