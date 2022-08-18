import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key);

  static List levels = [
    {
      "level": "level 1",
      "badgeimg": "assets/images/level1.png",
      "benifit": "1 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": "Unlocked on 1st Purchase",
      "gift coins": null,
      "offer": null,
      "highlight_nickname": null,
      "badge": null,
      "profile view": null,
      "isButton": false
    },
    {
      "level": "level 2",
      "badgeimg": "assets/images/level2.png",
      "benifit": "2 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": "Unlocked on 1st Purchase",
      "gift coins": "Gift coins 2000 coins",
      "offer": null,
      "highlight_nickname": null,
      "badge": null,
      "profile view": null,
      "isButton": false
    },
    {
      "level": "level 3",
      "badgeimg": "assets/images/level3.png",
      "benifit": "3 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": null,
      "gift coins": "Gift coins 2000 coins",
      "offer": "Membership Price Get 50% discount",
      "highlight_nickname": null,
      "badge": null,
      "profile view": null,
      "isButton": true
    },
    {
      "level": "level 4",
      "badgeimg": "assets/images/level4.png",
      "benifit": "4 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": null,
      "gift coins": "Gift coins 2000 coins",
      "offer": "Membership Price Get 50% discount",
      "highlight_nickname": "Highight Nickname",
      "badge": null,
      "profile view": null,
      "isButton": true
    },
    {
      "level": "level 5",
      "badgeimg": "assets/images/level5.png",
      "benifit": "5 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": null,
      "gift coins": "Gift coins 2000 coins",
      "offer": "Membership Price Get 50% discount",
      "highlight_nickname": "Highight Nickname",
      "badge": "Level badge",
      "profile view": null,
      "isButton": true
    },
    {
      "level": "level 6",
      "badgeimg": "assets/images/level6.png",
      "benifit": "6 benifits",
      "special customer": "Special Customer Service",
      "unlock rule": null,
      "gift coins": "Gift coins 2000 coins",
      "offer": "Membership Price Get 50% discount",
      "highlight_nickname": "Highight Nickname",
      "badge": "Level badge",
      "profile view": "Check who viwed Profile",
      "isButton": true
    }
  ];

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView.builder(
          itemCount: 6,
          controller: controller,
          itemBuilder: (context, index) {
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color.fromARGB(255, 35, 6, 90),
                    const Color.fromARGB(255, 36, 20, 93).withOpacity(0.4),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: size.width / 6.5),
                        Text(
                          LevelScreen.levels[index]["level"],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 24),
                        ),
                        CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(29, 255, 255, 255),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.x,
                                  color: Colors.white,
                                  size: 16,
                                )))
                      ],
                    ),
                    SizedBox(
                      height: size.height / 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.previousPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                            )),
                        Container(
                          height: size.height / 5,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                  image: AssetImage(
                                      LevelScreen.levels[index]["badgeimg"]),
                                  fit: BoxFit.cover)),
                        ),
                        IconButton(
                            onPressed: () {
                              controller.nextPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Container(
                        height: size.height / 20,
                        width: size.width / 2,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/icons/banner.png"),
                                fit: BoxFit.contain)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 65,
                            ),
                            Text(
                              LevelScreen.levels[index]["benifit"],
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  color: Color.fromARGB(140, 80, 32, 138),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    SizedBox(
                      height: size.height / 3,
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: size.height / 10,
                                  width: size.width / 4,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.person_outline,
                                        color: Colors.yellow,
                                      ),
                                      SizedBox(
                                        height: size.height / 100,
                                      ),
                                      SizedBox(
                                        height: size.height / 20,
                                        width: size.width / 4,
                                        child: Text(
                                          LevelScreen.levels[index]
                                              ["special customer"],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.fade,
                                              fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                LevelScreen.levels[index]["gift coins"] != null
                                    ? Container(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.coins,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height / 100,
                                            ),
                                            SizedBox(
                                              height: size.height / 20,
                                              width: size.width / 4,
                                              child: Text(
                                                LevelScreen.levels[index]
                                                    ["gift coins"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                LevelScreen.levels[index]["offer"] != null
                                    ? Container(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.discount_rounded,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height / 100,
                                            ),
                                            SizedBox(
                                              height: size.height / 20,
                                              width: size.width / 4,
                                              child: Text(
                                                LevelScreen.levels[index]
                                                    ["offer"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            LevelScreen.levels[index]["unlock rule"] != null
                                ? SizedBox(
                                    height: size.height / 50,
                                  )
                                : Container(),
                            LevelScreen.levels[index]["unlock rule"] != null
                                ? Text(
                                    LevelScreen.levels[index]["unlock rule"],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                : Container(),
                            SizedBox(
                              height: size.height / 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LevelScreen.levels[index]
                                            ["highlight_nickname"] !=
                                        null
                                    ? Container(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.edit,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height / 100,
                                            ),
                                            SizedBox(
                                              height: size.height / 20,
                                              width: size.width / 4,
                                              child: Text(
                                                LevelScreen.levels[index]
                                                    ["highlight_nickname"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                LevelScreen.levels[index]["badge"] != null
                                    ? Container(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              FontAwesomeIcons.medal,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height / 100,
                                            ),
                                            SizedBox(
                                              height: size.height / 20,
                                              width: size.width / 4,
                                              child: Text(
                                                LevelScreen.levels[index]
                                                    ["badge"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                                LevelScreen.levels[index]["profile view"] !=
                                        null
                                    ? Container(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Column(
                                          children: [
                                            const Icon(
                                              Icons.person_outline,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(
                                              height: size.height / 100,
                                            ),
                                            SizedBox(
                                              height: size.height / 20,
                                              width: size.width / 4,
                                              child: Text(
                                                LevelScreen.levels[index]
                                                    ["profile view"],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    overflow: TextOverflow.fade,
                                                    fontSize: 11),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: size.height / 10,
                                        width: size.width / 4,
                                      )
                              ],
                            ),
                            SizedBox(
                              height: size.height / 30,
                            ),
                            LevelScreen.levels[index]["isButton"] != false
                                ? Container(
                                    height: size.height / 15,
                                    width: size.width / 2,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Color.fromARGB(148, 214, 228, 11),
                                          Color.fromARGB(255, 173, 179, 20),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(24)
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
