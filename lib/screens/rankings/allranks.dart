import 'package:flutter/material.dart';
import 'package:metachat/screens/rankings/daily_rankings.dart';

import '../../color.dart';

class AllRanksScreens extends StatelessWidget {
  const AllRanksScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Rankings"),
          elevation: 0,
          centerTitle: true,
          foregroundColor: foreground,
          bottom: const TabBar(
              labelColor: Colors.pink,
              indicatorColor: Colors.pink,
              tabs: <Widget>[
                Tab(
                  text: "Daily",
                ),
                Tab(
                  text: "Weekly",
                ),
                Tab(
                  text: "Monthly",
                ),
              ],
            ),
        ),
        body: TabBarView(children: [
          DailyRankingScreen(),
          DailyRankingScreen(),
          DailyRankingScreen(),
        ]),
      ),
    );
  }
}