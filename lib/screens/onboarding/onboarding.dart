import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:metachat/color.dart';
import 'package:metachat/screens/signin/signin_options.dart';
import 'package:page_transition/page_transition.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();

  static List containerList = [
    //1st Image of Slider
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1522228115018-d838bcce5c3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dGluZGVyJTIwZ2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
          fit: BoxFit.cover,
        ),
      ),
    ),

    //2nd Image of Slider
    Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: const DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1440589473619-3cde28941638?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRpbmRlciUyMGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
          fit: BoxFit.cover,
        ),
      ),
    ),

    //3rd Image of Slider
    Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.black,
        image: const DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1441123694162-e54a981ceba5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHRpbmRlciUyMGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  ];
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentindex = 0;
  final CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SizedBox(
                height: size.height / 32,
                width: size.width,
                child: Stack(
                  children: [
                    Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const SignInOptions(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Text(
                            "Skip",
                            style:
                                TextStyle(color: languagetextcolor, fontSize: 18),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: OnboardingScreen.containerList.length,
              itemBuilder: (context, index, int index1) {
                return OnboardingScreen.containerList[index];
              },
              options: CarouselOptions(
                  height: size.height / 2.3,
                  enlargeCenterPage: true,
                  initialPage: 0,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: true,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentindex = index;
                    });
                  }),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: SizedBox(
                height: size.height / 15,
                width: size.width,
                child: Center(
                  child: onboardingtext[_currentindex],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: _currentindex.toDouble(),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                color: const Color.fromARGB(255, 228, 154, 179),
                activeSize: const Size(25.0, 9.0),
                activeColor: languagetextcolor,
                spacing: const EdgeInsets.symmetric(horizontal: 2),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
            SizedBox(
              height: size.height / 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.previousPage();
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: languagetextcolor, fontSize: 18),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (_currentindex != 2) {
                        controller.nextPage();
                      } else {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: const SignInOptions(),
                                type: PageTransitionType.rightToLeft));
                      }
                    },
                    backgroundColor: languagetextcolor,
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final List onboardingtext = [
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        const TextSpan(
            text: "Find the people who ",
            style: TextStyle(color: Colors.grey, fontSize: 20)),
        TextSpan(
            text: "match ",
            style: TextStyle(color: languagetextcolor, fontSize: 20)),
        const TextSpan(
            text: "with you. ",
            style: TextStyle(color: Colors.grey, fontSize: 20))
      ]),
    ),
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        const TextSpan(
            text: "Easily ",
            style: TextStyle(color: Colors.grey, fontSize: 20)),
        TextSpan(
            text: "message ",
            style: TextStyle(color: languagetextcolor, fontSize: 20)),
        const TextSpan(
            text: "and ", style: TextStyle(color: Colors.grey, fontSize: 20)),
        TextSpan(
            text: "call ",
            style: TextStyle(color: languagetextcolor, fontSize: 20)),
        const TextSpan(
            text: "people you like. ",
            style: TextStyle(color: Colors.grey, fontSize: 20)),
      ]),
    ),
    RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        const TextSpan(
            text: "Don’t wait anymore, find people you ",
            style: TextStyle(color: Colors.grey, fontSize: 20)),
        TextSpan(
            text: "like ",
            style: TextStyle(color: languagetextcolor, fontSize: 20)),
        const TextSpan(
            text: ". ", style: TextStyle(color: Colors.grey, fontSize: 20))
      ]),
    ),
  ];
}
