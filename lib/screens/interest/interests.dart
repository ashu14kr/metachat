import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../color.dart';
import '../../controllers/user.dart';
import '../home/home.dart';

class InterestsScreen extends StatefulWidget {
  final String fullname;
  final String email;
  final String phoneno;
  final String location;
  final String gender;
  final File profileimg;
  const InterestsScreen(
      {Key? key,
      required this.fullname,
      required this.email,
      required this.phoneno,
      required this.location,
      required this.gender,
      required this.profileimg})
      : super(key: key);

  static List interests = [
    "Fish curry",
    "butter chicken",
    "Butter nann",
    "Palak paneer",
    "Chips",
    "Action",
    "Comedy",
    "Thriller",
    "Horror",
    "Romance",
    "Mystery",
  ];

  static List selected = [];

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {

  final userController = Get.put(UserController());
  final id = FirebaseAuth.instance.currentUser?.uid;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonText(
            btnname: "CONTINUE",
            ontap: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     child: AddImages(
              //       fullname: widget.fullname,
              //       email: widget.email,
              //       gender: widget.gender,
              //       interest: InterestsScreen.selected,
              //       location: widget.location,
              //       phoneno: widget.phoneno,
              //       profileimg: widget.profileimg,
              //     ),
              //     type: PageTransitionType.rightToLeft,
              //   ),
              // );

              EasyLoading.show();
              userController.postuserdata(
                  id!,
                  widget.fullname,
                  id!,
                  widget.phoneno,
                  widget.email,
                  widget.profileimg,
                  widget.location,
                  widget.gender,
                  "offline",
                  InterestsScreen.selected,
                  ).whenComplete(() {
                    EasyLoading.dismiss();
                  });
                  Navigator.push(context, MaterialPageRoute(builder: ((context) => HomeScreen())));
            }),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Select your Interests"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            SizedBox(
              height: size.height / 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Container(
                alignment: Alignment.center,
                height: size.height / 10,
                width: size.width,
                decoration: const BoxDecoration(),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Select your",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      TextSpan(
                        text: " interests",
                        style: TextStyle(
                          color: languagetextcolor,
                          fontSize: 17,
                        ),
                      ),
                      const TextSpan(
                        text: " to match with users who have things in common.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Container(
              child: MultiSelectChipDisplay(
                textStyle: TextStyle(color: Colors.white),
                items: InterestsScreen.interests
                    .map((e) => MultiSelectItem(e, e))
                    .toList(),
                chipColor: languagetextcolor,
                onTap: (value) {
                  InterestsScreen.selected.contains(value)
                      ? InterestsScreen.selected.remove(value)
                      : InterestsScreen.selected.add(value);
                  print(InterestsScreen.selected);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
