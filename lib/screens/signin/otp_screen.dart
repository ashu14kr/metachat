import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/auth.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../color.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final authcontroller = Get.put(AuthController());
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Enter your OTP"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(
              height: size.height / 10,
              width: size.width,
              child: Center(
                child: Text(
                  "Enter the SMS verification Code sent to your number",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          PinCodeTextField(
            pinBoxHeight: size.height / 17,
            pinBoxWidth: size.width / 8,
            controller: controller,
            defaultBorderColor: const Color.fromARGB(255, 236, 152, 180),
            maxLength: 6,
          ),
          SizedBox(
            height: size.height / 45,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: size.height / 25,
              width: size.width,
              child: Stack(
                children: const [
                  Positioned(
                      right: 0,
                      child: Text(
                        "Resent",
                        style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            204,
                            68,
                            113,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height / 15,
          ),
          ButtonText(
            btnname: "NEXT",
            ontap: () {
              authcontroller.verifyOtp(controller.text, context);
              // Navigator.push(
              //   context,
              //   PageTransition(
              //     child: const ProfileInfoScrenn(),
              //     type: PageTransitionType.rightToLeft,
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }
}
