import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metachat/controllers/common.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:metachat/widget/custom_textfield.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';
import '../interest/interests.dart';

class ProfileInfoScrenn extends StatefulWidget {
  final String phoneno;
  final String location;
  const ProfileInfoScrenn(
      {Key? key, required this.phoneno, required this.location})
      : super(key: key);

  @override
  State<ProfileInfoScrenn> createState() => _ProfileInfoScrennState();
}

class _ProfileInfoScrennState extends State<ProfileInfoScrenn> {
  final id = FirebaseAuth.instance.currentUser?.uid;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final userController = Get.put(UserController());
  final commonController = Get.put(CommonController());
  static String? gender = "Gender";

  @override
  void initState() {
    print(widget.phoneno);
    print(widget.location);
    phoneController.text = widget.phoneno;
    locationController.text = widget.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ButtonText(
          btnname: "CONTINUE",
          ontap: () {
            // userController.postuserdata(
            //   id.toString(),
            //   nameController.text,
            //   id.toString(),
            //   phoneController.text,
            //   emailController.text,
            //   "profileimg",
            //   "location",
            //   "gender",
            //   "status",
            //   "interest",
            //   "userimgs",
            //   "uservideos",
            // );
            Navigator.push(
              context,
              PageTransition(
                child: InterestsScreen(
                  fullname: nameController.text,
                  email: emailController.text,
                  gender: gender.toString(),
                  location: widget.location,
                  phoneno: widget.phoneno,
                  profileimg: commonController.image.value,
                ),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Fill your profile"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 40,
            ),
            Center(
                child: Stack(
              children: [
                Obx(() {
                  return CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 231, 190, 204),
                    backgroundImage: commonController.pick.value
                        ? FileImage(commonController.image.value)
                        : null,
                    radius: 60,
                    child: commonController.pick.value
                        ? null
                        : Icon(
                            Icons.face,
                            color: Colors.white,
                            size: 80,
                          ),
                  );
                }),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: PopupMenuButton(
                        icon: Icon(
                          Icons.add,
                          color: languagetextcolor,
                        ),
                        color: Color.fromARGB(233, 255, 255, 255),
                        splashRadius: 24,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        onSelected: (value) {
                          if (value == 1) {
                            commonController.pickImg(ImageSource.gallery);
                          } else if (value == 2) {
                            commonController.pickImg(ImageSource.camera);
                          }
                        },
                        itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              const PopupMenuItem(
                                child: Text(
                                  'Gallery',
                                  style: TextStyle(color: Colors.pink),
                                ),
                                value: 1,
                              ),
                              const PopupMenuItem(
                                child: Text(
                                  'Camera',
                                  style: TextStyle(color: Colors.pink),
                                ),
                                value: 2,
                              ),
                            ]),
                  ),
                )
              ],
            )),
            SizedBox(
              height: size.height / 30,
            ),
            CustomTextField(
              hint: "Full Name",
              controller: nameController,
              keyboardtype: TextInputType.name,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            CustomTextField(
              hint: "Email",
              controller: emailController,
              keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            CustomTextField(
              hint: "Phone Number",
              controller: phoneController,
              keyboardtype: TextInputType.phone,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            CustomTextField(
              hint: "Location",
              controller: locationController,
              keyboardtype: TextInputType.name,
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "Gender",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 100,
                  ),
                  Container(
                    height: size.height / 13,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              gender.toString(),
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 17),
                            ),
                            PopupMenuButton(
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_rounded,
                                  color: languagetextcolor,
                                ),
                                color: Color.fromARGB(233, 255, 255, 255),
                                splashRadius: 24,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0))),
                                onSelected: (value) {
                                  if (value == 1) {
                                    setState(() {
                                      gender = "Female";
                                    });
                                  } else if (value == 2) {
                                    setState(() {
                                      gender = "Male";
                                    });
                                  } else if (value == 3) {
                                    setState(() {
                                      gender = "Others";
                                    });
                                  }
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry>[
                                      const PopupMenuItem(
                                        child: Text(
                                          'Female',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        value: 1,
                                      ),
                                      const PopupMenuItem(
                                        child: Text(
                                          'Male',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        value: 2,
                                      ),
                                      const PopupMenuItem(
                                        child: Text(
                                          'Others',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        value: 3,
                                      ),
                                    ]),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
          ],
        ),
      ),
    );
  }
}
