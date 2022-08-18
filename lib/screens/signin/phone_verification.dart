import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/color.dart';
import 'package:metachat/widget/button_text.dart';

import '../../controllers/auth.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final authcontroller = Get.put(AuthController());
  final numbercntrl = TextEditingController();
  static String? contrycode1 = "+91";
  static String? location = "India";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(authcontroller.updated.value);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Verify Your Phone Number"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                alignment: Alignment.center,
                height: size.height / 10,
                width: size.width,
                decoration: const BoxDecoration(),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      const TextSpan(
                        text:
                            "Enter your phone number you want to sign up or log in. We will not",
                        style: TextStyle(color: Colors.grey, fontSize: 17),
                      ),
                      TextSpan(
                        text: " share ",
                        style: TextStyle(
                          color: languagetextcolor,
                          fontSize: 17,
                        ),
                      ),
                      const TextSpan(
                        text: "your number with anyone",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                        ),
                      ),
                    ])),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              height: size.height / 13,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  CountryListPick(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      centerTitle: true,
                      foregroundColor: foreground,
                      elevation: 0,
                      title: const Text(
                        'select your country',
                      ),
                    ),
                    onChanged: (contrycode) {
                      setState(() {
                        contrycode1 = contrycode?.dialCode;
                        location = contrycode?.name;
                      });
                    },
                    theme: CountryTheme(
                      isShowFlag: true,
                      isShowTitle: false,
                      isShowCode: true,
                      isDownIcon: true,
                      showEnglishName: true,
                    ),
                    // Set default value
                    initialSelection: contrycode1,
                    useUiOverlay: true,
                    useSafeArea: false,
                  ),
                  Container(
                    height: size.height / 20,
                    width: size.width / 200,
                    decoration: BoxDecoration(color: languagetextcolor),
                  ),
                  SizedBox(
                    width: size.width / 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: size.height / 14,
                    width: size.width / 1.7,
                    child: Center(
                      child: TextFormField(
                        controller: numbercntrl,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          counterText: "",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height / 2.5,
            ),
            ButtonText(
              btnname: "CONFIRM",
              ontap: () {
                authcontroller.phoneAuth(numbercntrl.text, contrycode1!, location! ,context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
