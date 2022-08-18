import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/color.dart';
import 'package:metachat/controllers/media.dart';

class ImageViewScreen extends StatelessWidget {
  final File img;
  const ImageViewScreen({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final mediaController = Get.put(MediaController());
    final _uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 30),
        child: InkWell(
          onTap: () {
            mediaController.getimgsById(_uid).then((value) {
              if (value!.length >= 6) {
                EasyLoading.showToast("You can not post more than 6 images");
                Navigator.pop(context);
              } else {
                EasyLoading.show();
                mediaController.postImgs(img, _uid).whenComplete(() {
                  EasyLoading.dismiss();
                  Navigator.pop(context);
                });
              }
            });
          },
          child: Container(
            height: size.height / 15,
            width: size.width,
            decoration: BoxDecoration(
                color: languagetextcolor,
                borderRadius: BorderRadius.circular(16)),
            child: Center(
                child: Text(
              "POST IT",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            height: size.height / 2,
            width: size.width,
            child: Image.file(
              img,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
