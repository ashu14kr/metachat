import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metachat/screens/language/language.dart';
import 'package:page_transition/page_transition.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, PageTransition(child: const LanguageScreen(), type: PageTransitionType.rightToLeft));
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height/6,
            width: size.width,
            child: Image.asset("assets/images/splash2.png"),
          ),
        ],
      )
    );
  }
}