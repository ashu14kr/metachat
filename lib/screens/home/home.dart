import 'package:flutter/material.dart';
import 'package:metachat/screens/match/match.dart';
import 'package:metachat/screens/message/chatting_users.dart';
import 'package:metachat/screens/profile/owner_profile_info.dart';
import 'package:metachat/utils/randomUtils.dart';

import '../../color.dart';
import '../message/callscreens/pickup/pickup_layout.dart';
import '../randomusers/random.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static List icons = [
    "assets/icons/match.png",
    "assets/icons/tinder.png",
    "assets/icons/massage.png",
    "assets/icons/profile.png",
  ];

  static List pages = [
    const MatchScreen(),
    const RandomScreen(),
    const ChattingUsersScreen(),
    const OwnerProfileInfo(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with WidgetsBindingObserver{
  int _currentindex = 1;
  RandomUtils _randomUtils = RandomUtils();

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _randomUtils.checkUserStatus();
        break;
      case AppLifecycleState.inactive:
        _randomUtils.userNotAvaliable();
        break;
      case AppLifecycleState.paused:
        _randomUtils.userNotAvaliable();
        break;
      case AppLifecycleState.detached:
        _randomUtils.userNotAvaliable();
        break;
    }
}

@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: backgroundColor,
        bottomNavigationBar: Container(
          height: size.height / 12,
          width: size.width,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: HomeScreen.icons.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 15),
                child: Container(
                  height: size.height / 20,
                  width: size.width / 9,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          _currentindex = index;
                        });
                      },
                      child: Image.asset(
                        HomeScreen.icons[index],
                        color: _currentindex == 0
                            ? null
                            : _currentindex == index
                            ? const Color.fromARGB(255, 234, 138, 170)
                            : null,
                      ),
                    ),
                ),
              );
            },
          ),
        ),
        body: HomeScreen.pages.elementAt(_currentindex),
      ),
    );
  }
}
