import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/matchroom.dart';
import 'package:metachat/screens/match/match_room.dart';

class MatchUtils {
  final matchController = Get.put(MatchRoomController());

  checkAndMakeMatch(BuildContext context) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    String channelId = Random().nextInt(1000).toString();
    await matchController.getmatch().then((value) async {
      if (value.length != 0) {
        if (value.first.isAvailable == true && value.first.status == 0) {
          matchController
              .makematch(id: value.first.id, connectorId: uid)
              .then((h) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => MatchRoomScreen(
                      channelId: value.first.channelId,
                      id: value.first.id,
                    )),
              ),
            );
            EasyLoading.showToast(value.first.channelId);
          });
        } else if (value.first.isAvailable == false &&
            value.first.status == 1) {
          matchController.createRoom(channelId: channelId);
          // if(value.first.creatorId == uid && value.first.isAvailable == false && value.first.status == 1){
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => MatchRoomScreen(
                    channelId: channelId,
                    id: uid
                  )),
            ),
          ).then((value) => EasyLoading.showToast(channelId));
          // }
        }
      } else {
        // EasyLoading.showToast("No Data");
        matchController.createRoom(channelId: channelId);
        // if(value.first.creatorId == uid && value.first.isAvailable == false && value.first.status == 1){
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => MatchRoomScreen(
                    channelId: channelId,
                    id: uid
                  )),
            ),
          ).then((value) => EasyLoading.showToast(channelId));
          // }
      }
    });
  }




  skipAndCheckForMatch({required String id, required String cuid, required BuildContext context})async{
    if(id != cuid){
        // checkAndMakeMatch(context);
      EasyLoading.showToast("process");
      // Navigator.pop(context);
      // return;
    }else {
      checkAndMakeMatch(context);
      EasyLoading.showToast("already");
      // return;
    }
  }
}
