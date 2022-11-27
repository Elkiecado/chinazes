import 'package:flutter/material.dart';
import 'package:hackaton2/colors.dart';
import 'package:hive/hive.dart';

import '../Screens/MainPage/MainPage.dart';
import '../Screens/onboarding/onboarding.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({super.key});

  @override
  State<MenuBar> createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    MainPage(),
    MainPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');

    bool firstTimeState = box.get('introduction') ?? true;
    return firstTimeState
        ? const IntroductionPage()
        : Scaffold(
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: mainColour.withOpacity(0.6),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.density_medium),
                  label: 'Меню',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.emergency,
                    ),
                    label: 'Главная'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Профиль',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.purple[800],
              onTap: _onItemTapped,
            ),
          );
  }
}
