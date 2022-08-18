import 'package:flutter/material.dart';
import 'package:metachat/screens/connections/followers.dart';
import 'package:metachat/screens/connections/following.dart';

import '../../color.dart';

class ConnectionsScreen extends StatelessWidget {
  const ConnectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Connections"),
          centerTitle: true,
          elevation: 0,
          foregroundColor: foreground,
          bottom: const TabBar(
            labelColor: Colors.pink,
            indicatorColor: Colors.pink,
            tabs: <Widget>[
              Tab(
                text: "Followings",
              ),
              Tab(
                text: "Followers",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          FollowingScreen(),
          FollowersScreen(),
        ]),
      ),
    );
  }
}