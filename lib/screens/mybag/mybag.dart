import 'package:flutter/material.dart';
import 'package:metachat/screens/mybag/gift.dart';
import 'package:metachat/screens/mybag/props.dart';

import '../../color.dart';

class MyBagScreen extends StatelessWidget {
  const MyBagScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("My Bag"),
          elevation: 0,
          centerTitle: true,
          foregroundColor: foreground,
          bottom: const TabBar(
              labelColor: Colors.pink,
              indicatorColor: Colors.pink,
              tabs: <Widget>[
                Tab(
                  text: "My Badges",
                ),
                Tab(
                  text: "Gifts",
                ),
              ],
            ),
        ),
        body: TabBarView(children: [
          PropsScreen(),
          UserGiftScreen(),
        ]),
      ),
    );
  }
}