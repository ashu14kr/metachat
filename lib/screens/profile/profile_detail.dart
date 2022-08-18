import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/screens/media/add_image.dart';
import 'package:metachat/screens/media/add_videos.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';
import '../../models/users.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final userController = Get.put(UserController());
    final userid = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ButtonText(btnname: "SAVE", ontap: () {}),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Profile"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: userController.getUser(userid!),
            builder: (context, AsyncSnapshot<List<UserModel>?> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(
                  color: languagetextcolor,
                ));
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(link+"/uploads/${snapshot.data?[0].profileimg}"),
                              radius: 80,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.pink,
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height / 10,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Full Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Oath",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].oath,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Nickname",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            "160002444",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Birthday",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].dob,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "location",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].location,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "height",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].height,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "weight",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].weight,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "language",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].language,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sexual Orientation",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].gender,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "hair color",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          Text(
                            snapshot.data![0].haircolor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Change Location",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              // Navigator.push(
                              //           context,
                              //           PageTransition(
                              //             child: const InterestsScreen(),
                              //             type: PageTransitionType.rightToLeft,
                              //           ),
                              //         );
                            },
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Interest",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              // Navigator.push(
                              //           context,
                              //           PageTransition(
                              //             child: const InterestsScreen(),
                              //             type: PageTransitionType.rightToLeft,
                              //           ),
                              //         );
                            },
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Image Album",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const AddImageScreen(),
                                          type: PageTransitionType.rightToLeft,
                                        ),
                                      );
                            },
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(height: size.height/60,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Video Album",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                                fontSize: 16),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                        context,
                                        PageTransition(
                                          child: const AddVideoScreen(),
                                          type: PageTransitionType.rightToLeft,
                                        ),
                                      );
                            },
                            backgroundColor: Colors.white,
                            child: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.pink,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      const Divider(
                        height: 0.5,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text("Something went wrong !!!", style: TextStyle(color: languagetextcolor),));
              }
            }),
      ),
    );
  }
}
