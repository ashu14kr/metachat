import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/media.dart';
import 'package:metachat/screens/media/video_player.dart';

import '../../color.dart';

class VideoViewScreen extends StatelessWidget {
  final File vid;
  const VideoViewScreen({Key? key, required this.vid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mediaController = Get.put(MediaController());
    final uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children:[ 
        CustomVideoPlayer(vid: vid),
        Positioned(
          bottom: 0,
          left: 60,
          child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,),
          child: InkWell(
            onTap: (){
              EasyLoading.show();
              mediaController.postVideo(vid, uid).whenComplete((){
                EasyLoading.dismiss();
                EasyLoading.showToast('Your video is live now!');
                Navigator.pop(context);
              });
            },
            child: Container(
              height: size.height/15,
              width: size.width/1.5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: languagetextcolor,
                borderRadius: BorderRadius.circular(16)
              ),
              child: Center(child: Text("POST IT", textAlign: TextAlign.center ,style: TextStyle(color: Colors.white, fontSize: 18),)),
            ),
          ),
          ),
        ),
      ],)
    );
  }
}