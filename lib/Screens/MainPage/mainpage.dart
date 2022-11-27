import 'package:flutter/material.dart';
import 'package:hackaton2/Screens/Search/search.dart';
import 'package:hive/hive.dart';
import '../../colors.dart';
import '../onboarding/onboarding.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: search(),
    );
  }
}
