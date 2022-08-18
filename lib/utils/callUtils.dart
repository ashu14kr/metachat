import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/call.dart';
import 'package:metachat/models/calls.dart';
import 'package:metachat/screens/message/callscreens/customcallscreen.dart';

import '../screens/message/callscreens/callscreens.dart';

class CallUtils {
  final callController = Get.put(CallController());
  dial({String? cid, String? cname, String? cpic, String? rid, String? rname, String? rpic, context}) async {
    CallModel call = CallModel(
      callerId: cid,
      callerName: cname,
      callerPic: cpic,
      receiverId: rid,
      receiverName: rname,
      receiverPic: rpic,
      channelId: Random().nextInt(1000).toString(),
    );

    bool callMade = await callController.makecall(callModel: call);

    call.hasDialled = true;

    if (callMade) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomCallScreen(callModel: call),
          ));
    }
  }
}
