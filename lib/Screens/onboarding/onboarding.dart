import 'package:flutter/material.dart';
import 'package:hackaton2/Components/menu.dart';
import 'package:hackaton2/Screens/Loginpage/LoginPade.dart';
import 'package:hackaton2/Screens/MainPage/mainpage.dart';
import 'package:hackaton2/colors.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Здравствуй, молодой формацевт',
            body: '',
          ),
          PageViewModel(
            title: 'Title of 2nd Page',
            body: 'Body of 2nd Page',
          ),
          PageViewModel(
            title: 'Title of 3rd Page',
            body: 'Body of 3rd Page',
          ),
        ],
        onDone: () {
          box.put('introduction', false);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const MenuBar();
              },
            ),
          );
        },
        onSkip: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const MenuBar();
              },
            ),
          );
        },
        showSkipButton: true,
        skip: const Text("Skip",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36)),
        next: const Icon(
          Icons.forward,
          size: 1.5,
        ),
        done: const Text("Done",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 36)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: mainColour,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
