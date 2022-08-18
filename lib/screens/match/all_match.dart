import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metachat/screens/match/view_all_match.dart';
import 'package:metachat/screens/profile/view_profile.dart';
import 'package:page_transition/page_transition.dart';

import '../../color.dart';
import '../../constant.dart';
import '../../models/users.dart';

class AllMatchScreen extends StatelessWidget {
  final List<UserModel> user;
  const AllMatchScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("All Matches(${user.length})"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "New Match",
              style: TextStyle(color: Colors.pink, fontSize: 16),
            ),
          ),
          SizedBox(
            height: size.height / 80,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
              height: size.height / 2.8,
              width: size.width,
              child: ListView.builder(
                  reverse: true,
                  itemCount: user.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ViewProfile(
                                        name: user[index].name,
                                        profileimg: link+"/uploads/${user[index].profileimg}",
                                        height: user[index].height,
                                        age: user[index].dob,
                                        location: user[index].location,
                                        gender: user[index].gender,
                                        hair: user[index].haircolor,
                                        language: user[index].language,
                                        interests: user[index].interests, 
                                        id: user[index].id,
                                      )),
                                ),
                              );
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: size.height / 3,
                                width: size.width / 1.8,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                        image: NetworkImage(link +
                                            "/uploads/${user[index].profileimg}"),
                                        fit: BoxFit.cover)),
                              ),
                              Positioned(
                                right: 10,
                                top: 10,
                                child: Container(
                                  height: size.height / 30,
                                  width: size.width / 7,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
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
                              Positioned(
                                right: 0,
                                top: size.height / 16,
                                child: Container(
                                  height: size.height / 20,
                                  width: size.width / 3,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      const Color.fromARGB(255, 215, 46, 103),
                                      const Color.fromARGB(255, 198, 77, 69)
                                          .withOpacity(0.01),
                                    ],
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Text(
                                          "20",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: 24,
                                          width: 24,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/icons/coin.png"))),
                                        ),
                                        const Text(
                                          " /min",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 10,
                                bottom: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flag.fromString(
                                          "IN",
                                          height: size.width / 20,
                                          width: size.width / 12,
                                        ),
                                        Text(
                                          user[index].name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Model",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Container(
                                  height: size.height / 40,
                                  width: size.width / 12,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.locationPin,
                                        color: Colors.white,
                                        size: 10,
                                      ),
                                      Text(
                                        "24",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  })),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Match",
                  style: TextStyle(color: Colors.pink, fontSize: 16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ViewAllMatchScreen(
                          user: user,
                        ),
                        type: PageTransitionType.rightToLeft,
                      ),
                    );
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(color: Colors.pink, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Container(
                height: size.height / 3.8,
                width: size.width,
                child: ListView.builder(
                    itemCount: user.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ViewProfile(
                                        name: user[index].name,
                                        profileimg: link+"/uploads/${user[index].profileimg}",
                                        height: user[index].height,
                                        age: user[index].dob,
                                        location: user[index].location,
                                        gender: user[index].gender,
                                        hair: user[index].haircolor,
                                        language: user[index].language,
                                        interests: user[index].interests,
                                        id: user[index].id,
                                      )),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: size.height / 4,
                                  width: size.width / 2.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(color: Colors.pink),
                                      image: DecorationImage(
                                          image: NetworkImage(link +
                                              "/uploads/${user[index].profileimg}"),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Container(
                                    height: size.height / 30,
                                    width: size.width / 7,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
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
                                                color: Colors.red,
                                                fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: size.height / 18,
                                  child: Container(
                                    height: size.height / 20,
                                    width: size.width / 3,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        const Color.fromARGB(255, 215, 46, 103),
                                        const Color.fromARGB(255, 198, 77, 69)
                                            .withOpacity(0.01),
                                      ],
                                    )),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Text(
                                            "20",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            height: 24,
                                            width: 24,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/icons/coin.png"))),
                                          ),
                                          const Text(
                                            " /min",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  bottom: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Flag.fromString(
                                            "IN",
                                            height: size.width / 20,
                                            width: size.width / 12,
                                          ),
                                          Text(
                                            user[index].name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Model",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  bottom: 10,
                                  child: Container(
                                    height: size.height / 40,
                                    width: size.width / 12,
                                    decoration: BoxDecoration(
                                        color: Colors.pink,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          FontAwesomeIcons.locationPin,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        Text(
                                          "24",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    })),
              ))
        ],
      ),
    );
  }
}
