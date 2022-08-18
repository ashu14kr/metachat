import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/color.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/screens/message/callscreens/customcallscreen.dart';
import 'package:metachat/widget/button_text.dart';

import '../../controllers/call.dart';
import '../../controllers/user.dart';
import '../../models/users.dart';
import '../../utils/callUtils.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({Key? key}) : super(key: key);

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  UserController _userController = Get.put(UserController());
  final uid = FirebaseAuth.instance.currentUser!.uid;
  List<UserModel>? user;
  List<UserModel>? _currentUser;
  CallUtils callUtils = CallUtils();
  final callController = Get.put(CallController());

  @override
  void initState() {
    _userController.getUserByStatus("Online").then((value) {
      if (value!.length >= 4) {
        setState(() {
          user = value;
        });
        EasyLoading.showToast(value.length.toString());
        return;
      } else {
        EasyLoading.showToast("NO Data");
      }
    });
    _userController.getUser(uid).then((element) {
      setState(() {
        _currentUser = element;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 225, 7, 141),
              Color.fromARGB(217, 135, 14, 139),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 70,
                ),
                Row(
                  children: [
                    Text(
                      "EXPLORE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Profile(
                        size: size,
                        img: user != null
                            ? "$link/uploads/${user![0].profileimg}"
                            : "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                        name: user != null ? user![0].name : "Waiting",
                        onTap: () {
                          if (_currentUser != null &&
                              _currentUser!.length != 0) {
                            callUtils.dial(
                                cid: _currentUser!.first.id,
                                cname: _currentUser!.first.name,
                                cpic: _currentUser!.first.profileimg,
                                rid: user![0].id,
                                rname: user![0].name,
                                rpic: user![0].profileimg,
                                context: context);
                          } else {
                            EasyLoading.showToast("No Data");
                          }
                        },
                      ),
                      Profile(
                        size: size,
                        img: user != null
                            ? "$link/uploads/${user![1].profileimg}"
                            : "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                        name: user != null ? user![1].name : "Waiting",
                        onTap: () {
                          if (_currentUser != null &&
                              _currentUser!.length != 0) {
                            callUtils.dial(
                              cid: _currentUser!.first.id,
                              cname: _currentUser!.first.name,
                              cpic: _currentUser!.first.profileimg,
                              rid: user![1].id,
                              rname: user![1].name,
                              rpic: user![1].profileimg,
                              context: context);
                          } else {
                            EasyLoading.showToast("No Data");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Profile(
                        size: size,
                        img: user != null
                            ? "$link/uploads/${user![2].profileimg}"
                            : "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                        name: user != null ? user![2].name : "Waiting",
                        onTap: () {
                          if (_currentUser != null &&
                              _currentUser!.length != 0) {
                            callUtils.dial(
                              cid: _currentUser!.first.id,
                              cname: _currentUser!.first.name,
                              cpic: _currentUser!.first.profileimg,
                              rid: user![2].id,
                              rname: user![2].name,
                              rpic: user![2].profileimg,
                              context: context);
                          } else {
                            EasyLoading.showToast("No Data");
                          }
                        },
                      ),
                      Profile(
                        size: size,
                        img: user != null
                            ? "$link/uploads/${user![3].profileimg}"
                            : "https://cdn.wallpapersafari.com/99/96/eYSWAl.jpg",
                        name: user != null ? user![3].name : "Waiting",
                        onTap: () {
                          if (_currentUser != null &&
                              _currentUser!.length != 0) {
                            callUtils.dial(
                              cid: _currentUser!.first.id,
                              cname: _currentUser!.first.name,
                              cpic: _currentUser!.first.profileimg,
                              rid: user![3].id,
                              rname: user![3].name,
                              rpic: user![3].profileimg,
                              context: context);
                          } else {
                            EasyLoading.showToast("No Data");
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                ButtonText(
                    btnname: "RANDOMIZE",
                    ontap: () {
                      _userController.getUserByStatus("Online").then((value) {
                        if (value!.length >= 4) {
                          setState(() {
                            user = value;
                          });
                          EasyLoading.showToast(value.length.toString());
                          return;
                        } else {
                          setState(() {
                            user = null;
                          });
                          EasyLoading.showToast("NO Data");
                        }
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    required this.size,
    required this.img,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  final String img;
  final String name;
  final VoidCallback onTap;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: size.height / 4.5,
            width: size.width / 2.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                16,
              ),
              image: DecorationImage(
                image: NetworkImage(
                  img,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: size.height / 20,
              width: size.width / 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: size.height / 20,
                    width: size.width / 5,
                    color: Colors.transparent,
                    child: Text(
                      name,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: languagetextcolor,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                        backgroundColor: languagetextcolor,
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
