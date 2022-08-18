import 'package:flutter/material.dart';
import 'package:metachat/screens/aboutus/privacy_policy.dart';
import 'package:metachat/screens/aboutus/terms_of_service.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("About Us"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: size.height/20,),
            Center(
              child: Container(
                height: size.height/5,
                width: size.width/2.5,
                decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage("assets/icons/icon.png"), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(16)
                ),
              ),
            ),
            SizedBox(height: size.height/30,),
            // Text("Meta Chat", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 35),),
            Container(
              height: size.height/10,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/icons/metachat.png"))
              ),
            ),
            SizedBox(height: size.height/40,),
            Container(
              height: size.height/20,
              width: size.width,
              child: Text("We build relationship and bring people together ", style: TextStyle(color: Colors.black, fontSize: 18), textAlign: TextAlign.center,),
            ),
            SizedBox(height: size.height/20,),
            Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Terms of Service"),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const TermsOfServiceScreen(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.pink,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Privacy policy"),
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const PrivacyPolicyScreen(),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.pink,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height / 40,
                  ),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.pink,
                  ),
          ],
        ),
      ),
    );
  }
}