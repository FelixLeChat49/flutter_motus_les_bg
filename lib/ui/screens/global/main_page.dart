import 'package:flutter/material.dart';
import 'package:flutter_motus/ui/screens/game/game.dart';
import 'package:flutter_motus/ui/screens/profile/profile.dart';
import 'package:flutter_motus/ui/screens/scores/scores.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _index = 0;

  final List<Widget> _widgets = [
    const GamePage(),
    const ScoresPage(),
    const ProfilePage()
  ];

  void _changePage(int index){
    setState((){
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TusMo'),
      ),
      body: _widgets[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changePage,
        selectedItemColor: Colors.red,
        currentIndex: _index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sports_esports),label: 'Jeu'),
          BottomNavigationBarItem(icon: Icon(Icons.golf_course_sharp),label: 'Score'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Profil'),
        ],
      ),
    );
  }
}
