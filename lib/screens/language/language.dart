import 'package:flutter/material.dart';
import 'package:metachat/color.dart';
import 'package:metachat/screens/onboarding/onboarding.dart';
import 'package:metachat/widget/button_text.dart';
import 'package:page_transition/page_transition.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  static List language = [
    "English",
    "हिन्दी",
    "ಕನ್ನಡ",
    "தமிழ்",
    "తెలుగు",
    "മലയാളം",
    "ગુજરાતી",
  ];

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ButtonText(
            btnname: "Confirm",
            ontap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: const OnboardingScreen(),
                      type: PageTransitionType.rightToLeft));
            }),
      ),
      appBar: AppBar(
        title: const Text("Choose your language"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: foreground,
      ),
      body: ListView.builder(
        itemCount: LanguageScreen.language.length,
        itemBuilder: ((context, index) {
          return Container(
            height: size.height / 11,
            width: size.width,
            child: Column(
              children: [
                Divider(
                  height: 1,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    height: size.height / 12,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LanguageScreen.language[index],
                          style: TextStyle(
                            color: languagetextcolor,
                            fontSize: 18,
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(color: languagetextcolor)),
                            ),
                            Positioned(
                                left: 4.5,
                                top: 4.5,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor: _currentIndex == index
                                        ? languagetextcolor
                                        : null,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
