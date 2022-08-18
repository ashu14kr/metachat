import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/controllers/chat.dart';
import 'package:metachat/models/connection.dart';
import 'package:metachat/models/users.dart';
import 'package:metachat/screens/message/message.dart';
import 'package:metachat/screens/message/video_call_record.dart';
import 'package:metachat/screens/message/voice_call_record.dart';
import 'package:metachat/utils/connectionUtils.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';
import '../../controllers/user.dart';


class ChattingUsersScreen extends StatefulWidget {
  const ChattingUsersScreen({Key? key}) : super(key: key);

  @override
  State<ChattingUsersScreen> createState() => _ChattingUsersScreenState();
}

class _ChattingUsersScreenState extends State<ChattingUsersScreen> {

  final chatController = Get.put(ChatController());
  final userController = Get.put(UserController());
  ConnectionUtils _connectionUtils = ConnectionUtils();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Messages"),
          centerTitle: true,
          foregroundColor: foreground,
          actions: [
            PopupMenuButton(
                color: Color.fromARGB(233, 255, 255, 255),
                splashRadius: 24,
                onSelected: (value){
                  setState(() {
                    if(value == 2){
                      Navigator.push(
                            context,
                            PageTransition(
                              child: const VoiceCallRecord(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                    }else if(value == 3){
                      Navigator.push(
                            context,
                            PageTransition(
                              child: const VideoCallRecordScreen(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      const PopupMenuItem(
                        child: Text(
                          'All messages',
                          style: TextStyle(color: Colors.pink),
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text(
                          'Voice Call Records',
                          style: TextStyle(color: Colors.pink),
                        ),
                        value: 2,
                      ),
                      PopupMenuItem(
                        child: Text(
                          'Video Call Records',
                          style: TextStyle(color: Colors.pink),
                        ),
                        value: 3,
                      ),
                    ]),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
                height: size.height / 6,
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          // _connectionUtils.checkAndMakeConnection(ownerId: uid, connectedId: connectedId, img: img, name: name, lastmsg: lastmsg, context: context);
                        },
                        child: Container(
                          height: size.height/10,
                          width: size.width/2.3,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20,),
                            image: DecorationImage(image: AssetImage("assets/images/ilike.png",), fit: BoxFit.contain)
                          ),
                        ),
                      ),
                      Container(
                        height: size.height/10,
                        width: size.width/2.3,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20,),
                          image: DecorationImage(image: AssetImage("assets/images/likedme.png",), fit: BoxFit.contain)
                        ),
                      ),
                    ],
                  )
                )),
            SizedBox(
              height: size.height / 1.67,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Messages",
                          style: TextStyle(color: Colors.pink, fontSize: 18)),
                    ),
                    SizedBox(
                      height: size.height / 80,
                    ),
                    SizedBox(
                      height: size.height / 1.795,
                      width: size.width,
                      child: StreamBuilder(
                        stream: chatController.stremchats(),
                        builder: ((context,AsyncSnapshot<List<ConnectionModel>?> snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: CircularProgressIndicator());
                          }else if(snapshot.hasData){
                            return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: const MessageScreen(),
                                      type: PageTransitionType.rightToLeft,
                                    ),
                                  );
                                },
                                child: Container(
                                  height: size.height / 10,
                                  width: size.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(snapshot.data![index].connectedImg),
                                          radius: 30,
                                        ),
                                        SizedBox(
                                          width: size.width / 30,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height / 40,
                                            ),
                                            Text(
                                              snapshot.data![index].connectedName,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              snapshot.data![index].lastMessage,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.normal),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }));
                          }else{
                            return Text("Somthing Went Wrong");
                          }
                        })
                      ),
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
