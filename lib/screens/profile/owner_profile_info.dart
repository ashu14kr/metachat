import 'package:firebase_auth/firebase_auth.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/models/users.dart';
import 'package:metachat/screens/connections/connections.dart';
import 'package:metachat/screens/credit/credit_exchange.dart';
import 'package:metachat/screens/customer_care/customer_care.dart';
import 'package:metachat/screens/levels/level_screen.dart';
import 'package:metachat/screens/mybag/mybag.dart';
import 'package:metachat/screens/notification/notification.dart';
import 'package:metachat/screens/profile/profile_detail.dart';
import 'package:metachat/screens/rankings/allranks.dart';
import 'package:metachat/screens/settings/setting.dart';
import 'package:metachat/screens/stores/coin_store.dart';
import 'package:metachat/screens/task/task.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';

class OwnerProfileInfo extends StatelessWidget {
  const OwnerProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userController = Get.put(UserController());
    final userid = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future: userController.getUser(userid!),
                builder: ((context, AsyncSnapshot<List<UserModel>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else if (snapshot.hasData) {
                    return SizedBox(
                      height: size.height / 3.0,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const ProfileDetail(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(link+"/uploads/${snapshot.data?[0].profileimg}"),
                                    radius: 70,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 100,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: const LevelScreen(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    height: size.height / 25,
                                    width: size.width / 4,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            const Color.fromARGB(
                                                205, 240, 7, 112),
                                            Colors.red.withOpacity(0.2),
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Center(
                                        child: Text(
                                      "level-0",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height / 100,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const Coins(),
                                          type: PageTransitionType.rightToLeft,
                                        ),
                                      );
                                    },
                                    child: Container(
                                        height: size.height / 18,
                                        width: size.width / 2.5,
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                const Color.fromARGB(
                                                    62, 240, 7, 112),
                                                Colors.red.withOpacity(0.01),
                                                const Color.fromARGB(
                                                    141, 240, 7, 112),
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "My Balance",
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 255, 0, 68)),
                                              ),
                                              Container(
                                                height: size.height / 25,
                                                width: size.width / 12,
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/icons/bounty.png"))),
                                              )
                                            ])))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height / 40,
                                ),
                                Text(
                                  snapshot.data?[0].name.toString() ??
                                      "MetaChat",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.pink),
                                ),
                                Row(
                                  children: [
                                    Flag.fromString(
                                      "IN",
                                      height: size.width / 20,
                                      width: size.width / 12,
                                    ),
                                    Text(
                                      snapshot.data?[0].location.toString() ??
                                          "India",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "ID:160002444",
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                    SizedBox(
                                      width: size.width / 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          PageTransition(
                                            child: const ConnectionsScreen(),
                                            type:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.solidHeart,
                                        color: Colors.pink,
                                        size: 30,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: size.height / 40,
                                ),
                                Container(
                                    height: size.height / 6,
                                    width: size.width / 2.5,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 207, 199, 199),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/level1.png"),
                                            colorFilter: ColorFilter.mode(
                                                Colors.grey, BlendMode.color),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: const Center(
                                        child: Icon(
                                      Icons.lock,
                                      color: Colors.pink,
                                    ))),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(
                        child: Text(
                      "Something went wrong !!!",
                      style: TextStyle(color: languagetextcolor),
                    ));
                  }
                })),
            const Divider(
              height: 1,
              thickness: 0.2,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'Task',
              icon: Icons.task,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const TaskScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'Notifications',
              icon: Icons.notifications,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const NotificationScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'All Ranks',
              icon: FontAwesomeIcons.rankingStar,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const AllRanksScreens(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'Credits',
              icon: FontAwesomeIcons.coins,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const CreditScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'My Bag',
              icon: FontAwesomeIcons.bagShopping,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const MyBagScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'Customer care',
              icon: Icons.headphones,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const CustomerCare(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
            Menutile(
              size: size,
              text: 'Setting',
              icon: Icons.settings,
              onClick: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const SettingScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height / 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.pink,
              ),
            ),
            SizedBox(
              height: size.height / 60,
            ),
          ],
        ),
      ),
    );
  }
}

class Menutile extends StatelessWidget {
  const Menutile({
    Key? key,
    required this.size,
    required this.icon,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: Colors.pink,
                size: 35,
              ),
              SizedBox(
                width: size.width / 15,
              ),
              Text(text)
            ],
          ),
          InkWell(
            onTap: onClick,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.pink,
              ),
            ),
          )
        ],
      ),
    );
  }
}
