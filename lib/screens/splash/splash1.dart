import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metachat/screens/splash/splash2.dart';
import 'package:page_transition/page_transition.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
          context, PageTransition(child: const Splash2(), type: PageTransitionType.rightToLeft));
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
            child: Image.asset("assets/images/splash1.2.png"),
          ),
          SizedBox(height: size.height/40,),
          Container(
            height: size.height/10,
            width: size.width,
            child: Image.asset("assets/images/splash1.png"),
          ),
        ],
      )
    );
  }
}
