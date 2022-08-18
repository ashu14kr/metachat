import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../color.dart';

class LiveUserMatchScreen extends StatelessWidget {
  const LiveUserMatchScreen({Key? key}) : super(key: key);

  static List matches = [
    {
      "img":
          "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1604004555489-723a93d6ce74?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1563306406-e66174fa3787?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1464863979621-258859e62245?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1517677129300-07b130802f46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1530021232320-687d8e3dba54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDF8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      "name": "Senorita",
      "distance": "5 miles away"
    }
  ];

  static List girl = [
    "https://images.unsplash.com/photo-1524502397800-2eeaad7c3fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTR8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1576828831022-ca41d3905fb7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTN8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1525348371953-ac094a7e70be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1604004215402-e0be233f39be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fGdpcmx8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Live"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height / 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: size.height / 15,
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.pink,
                          ),
                          Container(
                            height: size.height / 20,
                            width: size.width / 1.9,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              maxLength: 10,
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                counterText: "",
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                PopupMenuButton(
                    color: Color.fromARGB(222, 255, 255, 255),
                    splashRadius: 24,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    icon: Icon(
                      Icons.sort,
                      color: Colors.pink,
                      size: 40,
                    ),
                    itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                          PopupMenuItem(
                              child: Row(
                            children: [
                              Flag.fromString(
                                "IN",
                                height: size.width / 20,
                                width: size.width / 12,
                              ),
                              Text(
                                "India",
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )),
                          PopupMenuItem(
                            child: Row(
                            children: [
                              Flag.fromString(
                                "au",
                                height: size.width / 20,
                                width: size.width / 12,
                              ),
                              Text(
                                "Australia",
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )
                          ),
                          PopupMenuItem(
                            child: Row(
                            children: [
                              Flag.fromString(
                                "gb",
                                height: size.width / 20,
                                width: size.width / 12,
                              ),
                              Text(
                                "United Kingdom",
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )
                          ),
                          PopupMenuItem(
                            child: Row(
                            children: [
                              Flag.fromString(
                                "IN",
                                height: size.width / 20,
                                width: size.width / 12,
                              ),
                              Text(
                                "India",
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )
                          ),
                          PopupMenuItem(
                            child: Row(
                            children: [
                              Flag.fromString(
                                "IN",
                                height: size.width / 20,
                                width: size.width / 12,
                              ),
                              Text(
                                "India",
                                style: TextStyle(
                                    color: languagetextcolor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          )
                          ),
                        ]),
              ],
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Container(
            height: size.height / 1.31,
            width: size.width,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            height: size.height / 3,
                            width: size.width / 1.8,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        matches[index]["img"]),
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
                                      "Rohini",
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
                      ));
                }),
          )
        ],
      ),
    );
  }
}