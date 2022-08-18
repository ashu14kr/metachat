import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:metachat/color.dart';
import 'package:metachat/screens/match/match_room.dart';
import 'package:metachat/screens/match/match_swipe.dart';
import 'package:metachat/screens/stores/coin_store.dart';
import 'package:metachat/screens/task/task.dart';
import 'package:metachat/utils/matchUtils.dart';
import 'package:page_transition/page_transition.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {

  MatchUtils match = MatchUtils();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 225, 7, 141),
              Color.fromARGB(217, 135, 14, 139),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: size.height / 8,
                width: size.width,
                child: Image.asset("assets/images/Explore.png"),
              ),
              SizedBox(
                height: size.height / 120,
              ),
              Container(
                height: 350,
                width: 350,
                child: Lottie.network(
                  'https://assets6.lottiefiles.com/private_files/lf30_txe2j1zd.json',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: size.height / 10,
              ),
              InkWell(
                onTap: () async{
                  await match.checkAndMakeMatch(context);
                },
                child: Container(
                  height: size.height / 15,
                  width: size.width / 2,
                  decoration: BoxDecoration(
                      color: languagetextcolor,
                      borderRadius: BorderRadius.circular(25)),
                  child: Center(
                      child: Text(
                    "MATCH NOW",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}









// SizedBox(
//               height: size.height / 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: (){
//                     Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const Coins(),
//                     type: PageTransitionType.rightToLeft,
//                   ),
//                 );
//                   },
//                   child: Row(
//                     children: [
//                       const Text(
//                         "Balance:20",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: size.width / 60,
//                       ),
//                       Container(
//                           height: 30,
//                           width: 30,
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage("assets/images/coins1.png"))))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: size.height / 15,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const MatchSwipeScreen(),
//                     type: PageTransitionType.rightToLeft,
//                   ),
//                 );
//               },
//               child: Container(
//                 height: size.height / 10,
//                 width: size.width / 2,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/icons/click.png"),
//                         fit: BoxFit.contain)),
//               ),
//             ),
//             SizedBox(
//               height: size.height / 40,
//             ),
//             const Text(
//               "Tap  The Screen to match",
//               style: TextStyle(color: Colors.white, fontSize: 17),
//             ),
//             SizedBox(
//               height: size.height / 10,
//             ),
//             Container(
//               height: size.height / 10,
//               width: size.width / 1.3,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.green, width: 3),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://images.unsplash.com/photo-1515621061946-eff1c2a352bd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTF8fGdpcmx8ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height / 60,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 80.0),
//                     child: Text(
//                       "Model Match",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 80,
//                   ),
//                   Row(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 20.0),
//                         child: Text(
//                           "10 coins",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                           height: 30,
//                           width: 30,
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image:
//                                       AssetImage("assets/images/coins1.png")))),
//                       const Text(
//                         "/match",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height / 40,
//             ),
//             const Text(
//               "VIP only costs 5coins/match",
//               style: TextStyle(color: Colors.white),
//             ),
//             SizedBox(
//               height: size.height / 20,
//             ),
//             Container(
//               height: size.height / 10,
//               width: size.width / 1.3,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: Colors.green, width: 3),
//                 image: const DecorationImage(
//                   image: NetworkImage(
//                       "https://images.unsplash.com/photo-1595959183082-7b570b7e08e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGdpcmx8ZW58MHwxfDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height / 60,
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(right: 80.0),
//                     child: Text(
//                       "Female Match",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 80,
//                   ),
//                   Row(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.only(left: 20.0),
//                         child: Text(
//                           "3 coins",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       Container(
//                           height: 30,
//                           width: 30,
//                           decoration: const BoxDecoration(
//                               image: DecorationImage(
//                                   image:
//                                       AssetImage("assets/images/coins1.png")))),
//                       const Text(
//                         "/match",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 17,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: size.height / 40,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: InkWell(
//                     onTap: (){
//                     Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const Coins(),
//                     type: PageTransitionType.rightToLeft,
//                   ),
//                 );
//                     },
//                     child: Container(
//                       height: size.height / 20,
//                       width: size.width / 3,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Row(
//                         children: [
//                           Container(
//                               height: 30,
//                               width: 30,
//                               decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                       image: AssetImage(
//                                           "assets/images/coins1.png")))),
//                           const Text(
//                             "COIN STORE",
//                             style: TextStyle(color: Colors.pink),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: InkWell(
//                     onTap: (){
//                       Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const TaskScreen(),
//                     type: PageTransitionType.rightToLeft,
//                   ),
//                 );
//                     },
//                     child: Container(
//                       height: size.height / 20,
//                       width: size.width / 3,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(16)),
//                       child: Center(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Icon(
//                               Icons.task,
//                               color: Colors.pink,
//                             ),
//                             Text(
//                               "TASK",
//                               style: TextStyle(color: Colors.pink),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
