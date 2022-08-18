import 'package:flutter/material.dart';
import 'package:metachat/color.dart';
import 'package:metachat/screens/message/message.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:page_transition/page_transition.dart';

class MatchStatus extends StatelessWidget {
  final String matchimg;
  final String currentUser;
  const MatchStatus({Key? key, required this.matchimg, required this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: size.height / 7,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Stack(children: [
              Row(
                children: [
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(-20 / 360),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(61, 222, 105, 144),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(matchimg),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: Container(
                      height: size.height / 3.5,
                      width: size.width / 2.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(61, 240, 101, 148),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(currentUser),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              )
            ]),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Stack(children: [
              SizedBox(
                height: size.height/15,
                width: size.width/5,
                child: CircularProgressIndicator(
                  color: languagetextcolor,
                  value: 1,
                ),
              ),
              const Positioned(
                bottom: 16,
                left: 10,
                child: Text("100%", style: TextStyle(color: Colors.pink, fontSize: 14),))
            ]),
          ),
          SizedBox(height: size.height/20,),
          Container(
            height: size.height/10,
            width: size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/Oh Snap!.png"))
            ),
          ),
          SizedBox(height: size.height/50,),
          const Text("Don’t keep waiting say Hello! now", style: TextStyle(color: Colors.black),),
          SizedBox(height: size.height/20,),
          ButtonText(btnname: "Say Hello!", ontap: (){
            Navigator.push(
                  context,
                  PageTransition(
                    child: const MessageScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
          }),
          SizedBox(height: size.height/40,),
          ButtonText(btnname: "Keep Swiping", ontap: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
