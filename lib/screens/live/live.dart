import 'package:firebase_auth/firebase_auth.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/controllers/call.dart';
import 'package:metachat/controllers/media.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/models/users.dart';
import 'package:metachat/models/videos.dart';
import 'package:metachat/screens/live/for_you.dart';
import 'package:metachat/screens/live/live_matches.dart';
import 'package:metachat/screens/live/video_controller.dart';
import 'package:metachat/screens/profile/view_profile.dart';
import 'package:metachat/utils/callUtils.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  State<LiveScreen> createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  final mediaController = Get.put(MediaController());
  final userController = Get.put(UserController());
  final callController = Get.put(CallController());
  final uid = FirebaseAuth.instance.currentUser!.uid;
  String rid = "";
  String rname = "";
  String rpic = "";
  static String cid = "";
  static String cname = "";
  static String cpic = "";
  CallUtils callUtils = CallUtils();

  @override
  void initState() {
    userController.getUser(uid).then((value) {
      cid = value!.first.id;
      cname = value.first.name;
      cpic = value.first.profileimg;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        extendBody: true,
        body: FutureBuilder(
            future: mediaController.getvideos(),
            builder: ((context, AsyncSnapshot<List<VideoModel>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Stack(
                      children: [
                        VideoController(
                            vid: link +
                                "/uploads/${snapshot.data![index].video}"),
                        FutureBuilder(
                            future: userController
                                .getUser(snapshot.data![index].uid),
                            builder: ((context,
                                AsyncSnapshot<List<UserModel>?> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasData) {
                                rid = snapshot.data![0].id;
                                rname = snapshot.data![0].name;
                                rpic = snapshot.data![0].profileimg;
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 32.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return ViewProfile(
                                                name: snapshot.data![0].name,
                                                profileimg: link +
                                                    "/uploads/${snapshot.data![0].profileimg}",
                                                height:
                                                    snapshot.data![0].height,
                                                hair:
                                                    snapshot.data![0].haircolor,
                                                age: snapshot.data![0].dob,
                                                gender:
                                                    snapshot.data![0].gender,
                                                location:
                                                    snapshot.data![0].location,
                                                language:
                                                    snapshot.data![0].language,
                                                interests:
                                                    snapshot.data![0].interests, 
                                                id: snapshot.data![0].id,
                                              );
                                            }));
                                          },
                                          child: Container(
                                            height: size.height / 13,
                                            width: size.width / 1.5,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                Colors.red.withOpacity(0.15),
                                                const Color.fromARGB(
                                                    255, 221, 23, 9),
                                              ],
                                            )),
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/level5.png"),
                                                              fit: BoxFit
                                                                  .contain)),
                                                    ),
                                                    SizedBox(
                                                      width: size.width / 100,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                              size.height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Text(
                                                              snapshot.data![0]
                                                                  .name,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                            Text(
                                                              " (level-5)",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 15),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              size.height / 200,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Flag.fromString(
                                                              "IN",
                                                              height:
                                                                  size.width /
                                                                      20,
                                                              width:
                                                                  size.width /
                                                                      12,
                                                            ),
                                                            const Text(
                                                              "Nickname: Rohi",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          49,
                                                                          253,
                                                                          56),
                                                                  fontSize: 12),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                  child:
                                                      const LiveUserMatchScreen(),
                                                  type: PageTransitionType
                                                      .rightToLeft,
                                                ),
                                              );
                                            },
                                            child: Container(
                                              height: size.height / 30,
                                              width: size.width / 7,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: const [
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Colors.green,
                                                      radius: 5,
                                                    ),
                                                    Text(
                                                      "LIVE",
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ));
                              } else {
                                return Text("No Data");
                              }
                            })),
                        Positioned(
                            right: 0,
                            top: size.height / 10,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const ForYouScreen(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  FontAwesomeIcons.solidCopy,
                                  color: languagetextcolor,
                                ))),
                        Positioned(
                          left: 0,
                          top: size.height / 8,
                          child: Container(
                            height: size.height / 20,
                            width: size.width / 3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                const Color.fromARGB(255, 198, 77, 69)
                                    .withOpacity(0.01),
                                const Color.fromARGB(255, 215, 46, 103),
                              ],
                            )),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "20",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    height: 24,
                                    width: 24,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/coin.png"))),
                                  ),
                                  const Text(
                                    " /min",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: SizedBox(
                            height: size.height / 7,
                            width: size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {},
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.heart,
                                      color: languagetextcolor,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      callUtils.dial(
                                          cid: cid,
                                          cname: cname,
                                          cpic: cpic,
                                          rid: rid,
                                          rname: rname,
                                          rpic: rpic,
                                          context: context);
                                    },
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      FontAwesomeIcons.video,
                                      color: languagetextcolor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              }
            })));
  }
}
