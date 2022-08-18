import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:metachat/color.dart';
import 'package:metachat/controllers/chat.dart';
import 'package:metachat/controllers/user.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../constant.dart';
import '../../../controllers/call.dart';
import '../../../controllers/common.dart';
import '../../../models/calls.dart';

class CustomCallScreen extends StatefulWidget {
  final CallModel? callModel;
  const CustomCallScreen({Key? key, this.callModel}) : super(key: key);

  @override
  State<CustomCallScreen> createState() => _CustomCallScreenState();
}

class _CustomCallScreenState extends State<CustomCallScreen> {
  final _chatController = Get.put(ChatController());
  final userController = Get.put(UserController());
  TextEditingController chatTextController = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  final callController = Get.put(CallController());
  String opposid = '';
  String userName = '';

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  late String token;
  final commonController = Get.put(CommonController());

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    await commonController
        .getToken(widget.callModel!.channelId.toString())
        .then((value) {
      setState(() {
        token = value.token;
        print(token);
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

    await _engine.joinChannel(
        token, widget.callModel!.channelId.toString(), null, 0);
  }

  checkuid() {
    if (widget.callModel!.callerId != uid) {
      setState(() {
        opposid = widget.callModel!.callerId.toString();
        userController.getUser(widget.callModel!.callerId.toString()).then((value) {
          setState(() {
            userName = value!.first.name;
          });
        });
      });
    } else {
      setState(() {
        opposid = widget.callModel!.receiverId.toString();
        userController.getUser(widget.callModel!.receiverId.toString()).then((value) {
          setState(() {
            userName = value!.first.name;
          });
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // initAgora();
    checkuid();
    _chatController.connects();
  }

  @override
  Future<void> dispose() async {
    _chatController.messages.value.clear();
    chatTextController.dispose();
    _engine.leaveChannel();
    await callController.endCall(callModel: widget.callModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height,
              width: size.width,
              child: _remoteVideo(),
            ),
            Container(
              height: size.height / 10,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [languagetextcolor, Colors.pink.shade100])),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: size.height / 12,
                          child: Center(
                            child: Text(
                              userName,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height / 12,
                          width: size.width / 4.5,
                          alignment: Alignment.center,
                          child: Text(
                            "(INDIA)",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    FloatingActionButton(
                      backgroundColor: languagetextcolor,
                      onPressed: () async {
                        // _engine.leaveChannel();
                        await callController.endCall(
                            callModel: widget.callModel);
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                  height: size.height / 2.25,
                  width: size.width,
                  color: Colors.transparent,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // _engine.muteAllRemoteVideoStreams(true)
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.cameraswitch_rounded,
                                  color: languagetextcolor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.voice_over_off,
                                color: languagetextcolor,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return Container(
                                  height: size.height / 5,
                                  width: size.width / 2,
                                  alignment: Alignment.bottomLeft,
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: SingleChildScrollView(
                                    reverse: true,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: _chatController
                                            .messages.value.length,
                                        itemBuilder: (context, index) {
                                          if (_chatController
                                                  .messages.value[index].type ==
                                              "source") {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: UnconstrainedBox(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: languagetextcolor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      _chatController.messages
                                                          .value[index].message,
                                                      style: TextStyle(
                                                        color:
                                                            Colors.pink.shade100,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: UnconstrainedBox(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.pink.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      _chatController.messages
                                                          .value[index].message,
                                                      style: TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 139, 27, 64),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        }),
                                  ));
                            }),
                            Container(
                              height: size.height / 5,
                              width: size.width / 2.5,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              child: _localUserJoined
                                  ? RtcLocalView.SurfaceView()
                                  : Center(child: CircularProgressIndicator()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: size.height / 18,
                              width: size.width / 2,
                              decoration: BoxDecoration(
                                  color: Colors.white54,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: size.height / 20,
                                        width: size.width / 2.8,
                                        child: TextFormField(
                                          controller: chatTextController,
                                          decoration: InputDecoration(
                                            hintText: "Type here...",
                                            hintStyle: const TextStyle(
                                                color: Colors.black54),
                                            border: InputBorder.none,
                                            counterText: "",
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _chatController.sendMessage(
                                              msg: chatTextController.text,
                                              sourceId: uid,
                                              targetId: opposid);
                                          chatTextController.clear();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: languagetextcolor,
                                          radius: 15,
                                          child: Icon(
                                            Icons.send,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/gift.png"),
                            ),
                            InkWell(
                              onTap: () {
                                _chatController.sendMessage(
                                    msg: "Send me some gift ??",
                                    sourceId: uid,
                                    targetId: opposid);
                                EasyLoading.showToast("ok");
                              },
                              child: Container(
                                height: size.height / 18,
                                width: size.width / 3.6,
                                decoration: BoxDecoration(
                                    color: languagetextcolor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                    child: Text(
                                  "Request Gift",
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(
        uid: _remoteUid!,
        channelId: widget.callModel!.channelId.toString(),
      );
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
