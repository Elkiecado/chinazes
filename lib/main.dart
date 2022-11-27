import 'package:flutter/material.dart';
import 'package:hackaton2/Components/menu.dart';
import 'package:hackaton2/Screens/MainPage/mainpage.dart';
import 'package:hackaton2/Screens/onboarding/onboarding.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Med',
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}
