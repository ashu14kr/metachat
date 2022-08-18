import 'package:firebase_auth/firebase_auth.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metachat/color.dart';
import 'package:metachat/screens/gift/view_all_gifts.dart';
import 'package:metachat/screens/message/message.dart';
import 'package:metachat/screens/rankings/allranks.dart';
import 'package:metachat/utils/connectionUtils.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:page_transition/page_transition.dart';

class ViewProfile extends StatefulWidget {
  final String id;
  final String name;
  final String profileimg;
  final String height;
  final String age;
  final String location;
  final String gender;
  final String hair;
  final String language;
  final List interests;
  const ViewProfile(
      {Key? key,
      required this.name,
      required this.profileimg,
      required this.height,
      required this.age,
      required this.location,
      required this.gender,
      required this.hair,
      required this.language,
      required this.interests,
      required this.id})
      : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  ConnectionUtils _connectionUtils = ConnectionUtils();
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: size.height / 12,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color.fromARGB(50, 240, 7, 112),
                  Colors.red.withOpacity(0.01),
                ],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: FloatingActionButton(
                  onPressed: () async {
                    // Navigator.push(
                    //     context,
                    //     PageTransition(
                    //         child: const MessageScreen(),
                    //         type: PageTransitionType.rightToLeft));
                    print(uid);
                    print(widget.id);
                    await _connectionUtils.checkAndMakeConnection(
                        ownerId: uid,
                        connectedId: widget.id,
                        context: context,
                        name: widget.name,
                        img: widget.profileimg,
                        lastmsg: "hello this is demo"
                    );
                  },
                  backgroundColor: Colors.white,
                  child: const Icon(
                    FontAwesomeIcons.message,
                    color: Colors.pink,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height / 50,
                      ),
                      const Text("Video Call"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "20",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 24,
                            width: 24,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/icons/coin.png"))),
                          ),
                          const Text(
                            " /min",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.pink,
                      child: const Icon(
                        FontAwesomeIcons.phone,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 2.4,
              width: size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height / 2.8,
                      width: size.width / 2.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: const Color.fromARGB(255, 231, 103, 146),
                              width: 3),
                          image: DecorationImage(
                              image: NetworkImage(widget.profileimg),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Flag.fromString(
                              "IN",
                              height: size.width / 20,
                              width: size.width / 12,
                            ),
                            Container(
                              height: size.height / 30,
                              width: size.width / 3,
                              child: Text(
                                widget.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/level5.png"),
                                      fit: BoxFit.contain)),
                            ),
                            Text(
                              "Level 5",
                              style: TextStyle(
                                  color: languagetextcolor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: size.height / 30,
                            width: size.width / 7,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 5,
                                  ),
                                  Text(
                                    "LIVE",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Text('ID: 1432450'),
                        SizedBox(
                          height: size.height / 100,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const AllRanksScreens(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Container(
                            height: size.height / 30,
                            width: size.width / 3.5,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 236, 98),
                                borderRadius: BorderRadius.circular(24)),
                            child: const Center(child: Text("Fans 41")),
                          ),
                        ),
                        SizedBox(
                          height: size.height / 100,
                        ),
                        Container(
                          height: size.height / 30,
                          width: size.width / 5,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 23, 202, 29),
                              borderRadius: BorderRadius.circular(24)),
                          child: const Center(
                              child: Text(
                            "Available",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: size.height / 100,
                        ),
                        SizedBox(
                          height: size.height / 7,
                          width: size.width / 2.4,
                          child: GridView.builder(
                              itemCount: 6,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 4.0,
                                mainAxisSpacing: 4.0,
                              ),
                              itemBuilder: (context, index) {
                                return Container(
                                  height: size.height / 100,
                                  width: size.width / 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              "https://images.unsplash.com/photo-1522228115018-d838bcce5c3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8dGluZGVyJTIwZ2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
                                          fit: BoxFit.cover)),
                                );
                              }),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height / 80,
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height / 4.5,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height / 100,
                    ),
                    const Text(
                      "Basic information",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "Height: ${widget.height}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "Age: ${widget.age}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "City: ${widget.location}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "Gender: ${widget.gender}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "Hair Colour: ${widget.hair}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: size.height / 200,
                    ),
                    Text(
                      "Language: ${widget.language}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height / 5,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Gifts Recieved:(19/53)",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const ViewAllGifts(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                          },
                          child: const Text(
                            "All gifts >",
                            style: TextStyle(color: Colors.pink),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 100,
                    ),
                    SizedBox(
                      height: size.height / 7,
                      width: size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: size.height / 20,
                                width: size.width / 5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: const DecorationImage(
                                        image: NetworkImage(
                                          "https://images.unsplash.com/photo-1608755727748-dfa2e44f255b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGdpZnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          })),
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: size.height / 5,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Interest",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height / 100,
                    ),
                    Container(
                      child: MultiSelectChipDisplay(
                        textStyle: TextStyle(color: Colors.white),
                        items: widget.interests
                            .map((e) => MultiSelectItem(e, e))
                            .toList(),
                        chipColor: languagetextcolor,
                        onTap: (value) {},
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
