import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/chat.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/message/message.dart';

class ConnectionUtils {
  final chatController = Get.put(ChatController());

  checkAndMakeConnection(
      {required String ownerId,
      required String connectedId,
      required String img,
      required String name,
      required String lastmsg,
      required BuildContext context}) {
    chatController.getConnection(connectedId).then((value) {
      if (value.length.isEqual(0)) {
        chatController.makeConnection(connectedId: connectedId, img: img, lastmsg: lastmsg, name: name).then((value) {
          Navigator.push(
              context,
              PageTransition(
                  child: const MessageScreen(),
                  type: PageTransitionType.rightToLeft));
        });
      } else {
        Navigator.push(
            context,
            PageTransition(
                child: const MessageScreen(),
                type: PageTransitionType.rightToLeft));
      }
    });
  }
}
