import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/models/users.dart';
import 'package:metachat/screens/match/all_match.dart';
import 'package:metachat/screens/match/components/swipe.dart';
import 'package:metachat/screens/match/match_status.dart';
import 'package:page_transition/page_transition.dart';
import 'package:swipe_cards/swipe_cards.dart';

import '../../color.dart';

class MatchSwipeScreen extends StatefulWidget {
  const MatchSwipeScreen({Key? key}) : super(key: key);

  @override
  State<MatchSwipeScreen> createState() => _MatchSwipeScreenState();
}

class _MatchSwipeScreenState extends State<MatchSwipeScreen> {
  final userController = Get.put(UserController());
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<UserModel> user = [];
  List<UserModel> cuser = [];
  String img = "";
  final currentUser = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    userController.getUser(currentUser!).then((value) {
      setState(() {
        cuser = value!;
      });
      if (value!.first.gender == "Female") {
        userController.getUserByGender("Male").then((male) {
          setState(() {
            user = male!;
            print("hey");
          });
          for (var i = 0; i < male!.length; i++) {
            _swipeItems.add(
              SwipeItem(
                  content: Content(
                    image: male[i].profileimg,
                  ),
                  likeAction: () {},
                  superlikeAction: () {},
                  nopeAction: () {}),
            );

            _matchEngine = MatchEngine(swipeItems: _swipeItems);
          }
        });
      } else {
        userController.getUserByGender("Female").then((female) {
          setState(() {
            user = female!;
            print(female.first.name);
          });
          for (var i = 0; i < female!.length; i++) {
            _swipeItems.add(
              SwipeItem(
                  content: Content(
                    image: female[i].profileimg,
                  ),
                  likeAction: () {},
                  superlikeAction: () {},
                  nopeAction: () {}),
            );

            _matchEngine = MatchEngine(swipeItems: _swipeItems);
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Swipe"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: user.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: AllMatchScreen(user: user,),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: Text(
                            "All-Match(${user.length})",
                            style: TextStyle(color: Colors.pink),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Container(
                      height: size.height / 1.7,
                      width: size.width / 1.2,
                      child: SwipeCards(
                        matchEngine: _matchEngine!,
                        onStackFinished: () {
                          EasyLoading.showToast("No More Match Exist???");
                        },
                        itemBuilder: ((context, index) {
                          img = link + "/uploads/${user[index].profileimg}";
                          return SwipeCard(
                            img: link + "/uploads/${user[index].profileimg}",
                            name: user[index].name,
                            status: user[index].status,
                          );
                        }),
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: MatchStatus(
                              matchimg: img, 
                              currentUser: link + "/uploads/${cuser.first.profileimg}",
                            ),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: Container(
                        height: size.height / 20,
                        width: size.width / 3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(24)),
                        child: const Text(
                          "MATCH",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  color: languagetextcolor,
                ),
              ),
      ),
    );
  }
}

class Content {
  final String? image;
  final String? name;
  final String? country;
  final String? status;

  Content({
    this.image,
    this.name,
    this.country,
    this.status,
  });
}
