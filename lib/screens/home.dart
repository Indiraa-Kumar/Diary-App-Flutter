import 'package:flutter/material.dart';
import 'achievement.dart';
import 'calendar.dart';
import 'certificate.dart';
import 'map.dart';
import 'notes.dart';
import 'profile.dart';
import 'todolist.dart';

class LoginHomePage extends StatefulWidget {
  const LoginHomePage({super.key});

  @override
  State<LoginHomePage> createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = const <Widget>[
    ProfilePage(),
    Calendar(),
    MapScreen(),
    TodoPage(),
    NotesPage(),
    CertificatePage(),
    AchievementPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.lightBlueAccent,
        selectedLabelStyle: const TextStyle(fontStyle: FontStyle.italic),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_chart),
            label: 'Certificates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Achievements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt),
            label: 'Notes',
          ),
        ],
      ),
    );
  }
}
