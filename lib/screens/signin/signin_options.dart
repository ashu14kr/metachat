import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:metachat/controllers/auth.dart';
import 'package:metachat/screens/signin/phone_verification.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:metachat/widget/buttonwith_icon.dart';
import 'package:page_transition/page_transition.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final authcontroller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1607758164193-19539498ddf4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmwlMjBmYWNlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              ),
              fit: BoxFit.cover,
              opacity: 0.6),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height / 1.8,
              ),
              ButtonText(
                btnname: "Phone",
                ontap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      child: const PhoneVerificationScreen(),
                      type: PageTransitionType.rightToLeft,
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height / 50,
              ),
              ButtonWithIcon(
                  btnname: "Google",
                  ontap: () => authcontroller.signInWithGoogle(),
                  icon: FontAwesomeIcons.google),
              SizedBox(
                height: size.height / 5,
              ),
              Container(
                alignment: Alignment.center,
                height: size.height / 10,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(
                    0.6,
                  ),
                ),
                child: const Text(
                  "By logging in you agree to our Terms of Service and Privacy Policy, including cookie use",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
