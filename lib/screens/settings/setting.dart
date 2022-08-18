import 'package:flutter/material.dart';
import 'package:metachat/screens/aboutus/about_us.dart';
import 'package:metachat/screens/changestatus/changestatus.dart';
import 'package:metachat/screens/language/language.dart';
import 'package:metachat/screens/message/blacklist_users.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Settings"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "ID",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Text(
                  "160002424",
                  style: TextStyle(
                      color: Colors.pink, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(
              height: size.height / 40,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.pink,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [Text("My Coins")],
                ),
                Row(
                  children: [
                    const Text("20 coins"),
                    SizedBox(
                      width: size.width / 60,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/coins1.png"))),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height / 40,
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.pink,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Change Status"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const ChangeStatusScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("App Language"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const LanguageScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Blocked List"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BlackListUsersScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.pink,
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("About Us"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const AboutUsScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.pink,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.pink,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
