import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SwipeCard extends StatelessWidget {
  final String img;
  final String name;
  final String status;
  const SwipeCard({Key? key, required this.img, required this.name, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 1.5,
        width: size.width / 1.2,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Container(
                height: size.height / 1.5,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(16)),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: size.height / 10,
                width: size.width / 1.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24)),
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: size.height / 60,
                            ),
                            Row(
                              children: [
                                Flag.fromString(
                                  "IN",
                                  height: size.width / 20,
                                  width: size.width / 12,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  width: size.width / 100,
                                ),
                                Container(
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
                              ],
                            ),
                            SizedBox(
                              height: size.height / 200,
                            ),
                            Container(
                              height: size.height / 30,
                              width: size.width / 5,
                              decoration: BoxDecoration(
                                  color: status == "offline" ? Colors.grey : Color.fromARGB(255, 23, 202, 29),
                                  borderRadius: BorderRadius.circular(24)),
                              child: Center(
                                  child: Text(
                                status,
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                        // CircularProgressIndicator(
                        //   strokeWidth: 2,
                        //   value: 0.9,
                        //   color: languagetextcolor,
                        // )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}
