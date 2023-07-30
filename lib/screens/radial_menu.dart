/* import 'package:animated_radial_menu/animated_radial_menu.dart';
import 'package:flutter/material.dart';
import 'package:sample_diary/screens/achievement.dart';
import 'package:sample_diary/screens/calendar.dart';
import 'package:sample_diary/screens/certificate.dart';
import 'package:sample_diary/screens/map.dart';
import 'package:sample_diary/screens/notes.dart';
import 'package:sample_diary/screens/todolist.dart';

class RadialMenuIcons extends StatelessWidget {
  const RadialMenuIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("My Diary"),
        centerTitle: true,
      ),
      body: RadialMenu(children: [
        RadialButton(
            icon: Icon(Icons.map_outlined),
            buttonColor: Colors.teal,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => MapScreen()))),
        RadialButton(
            icon: Icon(Icons.calendar_month_outlined),
            buttonColor: Colors.green,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => Calendar()))),
        RadialButton(
            icon: Icon(Icons.add_chart),
            buttonColor: Colors.orange,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CertificatePage()))),
        RadialButton(
            icon: Icon(Icons.bar_chart),
            buttonColor: Colors.indigo,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => AchievementPage()))),
        RadialButton(
            icon: Icon(Icons.task),
            buttonColor: Colors.pink,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => TodoPage()))),
        RadialButton(
            icon: Icon(Icons.note_alt),
            buttonColor: Colors.indigo,
            onPress: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => NotesPage()))),
      ]),
    );
  }
}

class TargetScreen extends StatelessWidget {
  const TargetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Target Screen")),
    );
  }
}
 */