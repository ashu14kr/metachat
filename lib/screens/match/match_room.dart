import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flag/flag_widget.dart';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:get/get.dart';
import 'package:metachat/utils/matchUtils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:metachat/color.dart';

import '../../constant.dart';
import '../../controllers/common.dart';
import '../../controllers/matchroom.dart';
import '../../controllers/user.dart';

class MatchRoomScreen extends StatefulWidget {
  final String channelId;
  final String id;
  const MatchRoomScreen({
    Key? key,
    required this.channelId,
    required this.id,
  }) : super(key: key);

  @override
  State<MatchRoomScreen> createState() => _MatchRoomScreenState();
}

class _MatchRoomScreenState extends State<MatchRoomScreen> {
  final appId = "903d72c603bf43d7a6b3414e810a0a46";
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final userController = Get.put(UserController());
  MatchUtils _matchUtils = MatchUtils();

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late String token;
  final commonController = Get.put(CommonController());
  final matchController = Get.put(MatchRoomController());

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    await commonController.getToken(widget.channelId).then((value) {
      setState(() {
        token = value.token;
        print("token $token");
      });
    });

    //create the engine
    _engine = await RtcEngine.create(appId);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(token, widget.channelId, null, 0);
  }

  // Stream<List<UserModel>?> stremUser() =>
  //     Stream.periodic(Duration(seconds: 1)).asyncMap((_) => _checkprofileId());

  @override
  void initState() {
    commonController.checkprofileId(widget.id);
    initAgora();
    super.initState();
  }

  @override
  void dispose() {
    _engine.leaveChannel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    commonController.user.value.length != 0
                        ? "$link/uploads/${commonController.user.value.first.profileimg}"
                        : "https://images.unsplash.com/photo-1535467728855-93fe6218a7b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: commonController.user.value.length == 0
                  ? BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 40.0, sigmaY: 40.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.0)),
                      ),
                    )
                  : null,
            );
          }),
          Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return ViewProfile(
                          //     name: snapshot.data![0].name,
                          //     profileimg:
                          //         link + "/uploads/${snapshot.data![0].profileimg}",
                          //     height: snapshot.data![0].height,
                          //     hair: snapshot.data![0].haircolor,
                          //     age: snapshot.data![0].dob,
                          //     gender: snapshot.data![0].gender,
                          //     location: snapshot.data![0].location,
                          //     language: snapshot.data![0].language,
                          //     interests: snapshot.data![0].interests,
                          //     id: snapshot.data![0].id,
                          //   );
                          // }));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height / 13,
                              width: size.width / 1.5,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Colors.red.withOpacity(0.15),
                                  const Color.fromARGB(255, 221, 23, 9),
                                ],
                              )),
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/level5.png"),
                                                fit: BoxFit.contain)),
                                      ),
                                      SizedBox(
                                        width: size.width / 100,
                                      ),
                                      Obx(() {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height / 200,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  commonController.user.value
                                                              .length !=
                                                          0
                                                      ? commonController
                                                          .user.value.first.name
                                                          .toString()
                                                      : "Waiting",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  " (level-5)",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height / 200,
                                            ),
                                            Row(
                                              children: [
                                                Flag.fromString(
                                                  "IN",
                                                  height: size.width / 20,
                                                  width: size.width / 12,
                                                ),
                                                const Text(
                                                  "Nickname: Rohi",
                                                  style: TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 49, 253, 56),
                                                      fontSize: 12),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      })
                                    ],
                                  )),
                            ),
                            Container(
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "30",
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   PageTransition(
                            //     child:
                            //         const LiveUserMatchScreen(),
                            //     type: PageTransitionType
                            //         .rightToLeft,
                            //   ),
                            // );
                          },
                          child: Container(
                            height: size.height / 30,
                            width: size.width / 7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 5,
                                  ),
                                  Text(
                                    "LIVE",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: size.height / 4,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height / 4.5,
                      width: size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: languagetextcolor),
                      child: Center(
                        child: _localUserJoined
                            ? RtcLocalView.SurfaceView()
                            : Text(
                                "Waiting",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 70,
                              width: 70,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white60,
                                color: languagetextcolor,
                                value: .5,
                                strokeWidth: 8,
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              left: 5,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Colors.pink,
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        InkWell(
                          onTap: () {
                            _engine.leaveChannel();
                            _matchUtils.skipAndCheckForMatch(
                                  id: widget.id,
                                  cuid: commonController.user.value.first.id,
                                  context: context);
                          },
                          child: Container(
                            height: size.height / 30,
                            width: size.width / 4,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(
                                16,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height / 4.5,
                      width: size.width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          color: languagetextcolor),
                      child: _remoteVideo(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
        channelId: widget.channelId,
      );
    } else {
      return Center(
        child: Text(
          "Waiting",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
