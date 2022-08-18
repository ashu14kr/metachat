import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/chat.dart';
import 'package:metachat/screens/gift/buy_gift.dart';
import 'package:metachat/screens/message/video_call.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final chatController = Get.put(ChatController());

  @override
  void initState() {
    chatController.connects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: SizedBox(
        height: size.height / 7.5,
        width: size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: size.height / 15,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height / 15,
                        width: size.width / 1.3,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          maxLength: 10,
                          decoration: const InputDecoration(
                            hintText: "message...",
                            hintStyle: TextStyle(color: Colors.pink),
                            border: InputBorder.none,
                            counterText: "",
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.send,
                        color: Colors.pink,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.microphone,
                        color: Colors.pink,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.image,
                        color: Colors.pink,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FontAwesomeIcons.camera,
                        color: Colors.pink,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BuyGiftScreen(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.gift,
                        color: Colors.pink,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Rohini"),
        centerTitle: true,
        foregroundColor: foreground,
        actions: [
          SizedBox(
            width: size.width / 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
            child: Container(
              height: size.height / 40,
              width: size.width / 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 211, 113, 146),
              ),
              child: const Icon(
                FontAwesomeIcons.phone,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
            child: Container(
              height: size.height / 40,
              width: size.width / 9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 211, 113, 146),
              ),
              child: IconButton(
                onPressed: () {
                },
                icon: Icon(
                  FontAwesomeIcons.video,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          PopupMenuButton(
              color: Color.fromARGB(233, 255, 255, 255),
              splashRadius: 24,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              onSelected: (value) {
                if (value == 1) {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     child: const ConnectionsScreen(),
                  //     type: PageTransitionType.rightToLeft,
                  //   ),
                  // );
                } else if (value == 2) {
                  // Navigator.push(
                  //   context,
                  //   PageTransition(
                  //     child: const BlackListUsersScreen(),
                  //     type: PageTransitionType.rightToLeft,
                  //   ),
                  // );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    const PopupMenuItem(
                      child: Text(
                        'Follow',
                        style: TextStyle(color: Colors.pink),
                      ),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text(
                        'Block',
                        style: TextStyle(color: Colors.pink),
                      ),
                      value: 2,
                    ),
                    const PopupMenuItem(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: 3,
                    ),
                  ]),
          SizedBox(
            width: size.width / 50,
          ),
        ],
      ),
    );
  }
}
