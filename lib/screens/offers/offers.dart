import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  static List offers = [
    {
      "img": "assets/icons/offer1.png",
      "offer": "Switch your camera",
      "description": "You can Switch your camera during live video call",
      "price": "₹100.00"
    },
    {
      "img": "assets/icons/offer2.png",
      "offer": "Daily Task",
      "description": "Complete daily task and get extra 5 free coins",
      "price": "₹200.00"
    },
    {
      "img": "assets/icons/offer3.png",
      "offer": "Coin gift",
      "description": "Get 150 Coins free for every 3rd Purchase",
      "price": "₹300.00"
    },
    {
      "img": "assets/icons/offer4.png",
      "offer": "Get 5% discount ",
      "description": "When you recharge coin",
      "price": "₹500.00"
    },
    {
      "img": "assets/icons/offer5.png",
      "offer": "Get VIP PASS ",
      "description": "Get 25% Discount on every purchase",
      "price": "₹5000.00"
    }
  ];

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {


  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                const Color.fromARGB(205, 240, 7, 112),
                Colors.red.withOpacity(0.2),
              ],
            ),
          ),
          child: PageView.builder(
              controller: controller,
              itemCount: 5,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const Icon(
                              FontAwesomeIcons.x,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Container(
                        height: size.height / 3,
                        width: size.width / 1.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(OffersScreen.offers[index]["img"]),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        height: size.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.previousPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                color: Colors.white,
                              )),
                          Column(
                            children: [
                              Text(
                                OffersScreen.offers[index]["offer"],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: size.height / 60,
                              ),
                              SizedBox(
                                height: size.height / 20,
                                width: size.width / 1.55,
                                child: Text(
                                  OffersScreen.offers[index]["description"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                controller.nextPage(
                                  duration: const Duration(microseconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn);
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: size.height / 60,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Container(
                                height: size.height / 5,
                                width: size.width / 2.3,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        const Color.fromARGB(205, 151, 7, 240),
                                        const Color.fromARGB(255, 15, 1, 30)
                                            .withOpacity(0.2),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(16)),
                               child: Column(
                                children: [
                                  SizedBox(height: size.height/40,),
                                  const Text("30 Days", style: TextStyle(color: Colors.white),),
                                  SizedBox(height: size.height/40,),
                                  Text(OffersScreen.offers[index]["price"], style: const TextStyle(color: Colors.white, fontSize: 24),),
                                  SizedBox(height: size.height/50,),
                                  const Text("save 50%", style: TextStyle(color: Colors.white),),
                                ],
                               ),
                            ),
                          ),
                            Positioned(
                              bottom: 0,
                              left: 30,
                              child: Container(
                                height: size.height/18,
                                width: size.width/3.5,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 108, 45, 216),
                                  borderRadius: BorderRadius.circular(24)
                                ),
                                child: const Text("GO", style: TextStyle(color: Colors.white),),
                              ),
                            )
                        ],
                      )
                    ],
                  ),
                );
              }))),
    );
  }
}
