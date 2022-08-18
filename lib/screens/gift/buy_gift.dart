import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metachat/screens/stores/coin_store.dart';
import 'package:page_transition/page_transition.dart';

class BuyGiftScreen extends StatelessWidget {
  const BuyGiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(214, 5, 5, 5),
      body: PageView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                SizedBox(height: size.height/20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(64, 255, 255, 255),
                      child: Icon(FontAwesomeIcons.x, color: Colors.white, size: 15,),
                    )
                  ],
                ),
                SizedBox(height: size.height/20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/coins3.png"))),
                        ),
                        SizedBox(
                          width: size.width / 20,
                        ),
                        const Text("My Balance",style: TextStyle(color: Colors.white))
                      ],
                    ),
                    Row(
                      children: [
                        const Text("20 coins", style: TextStyle(color: Colors.white),),
                        SizedBox(
                          width: size.width / 60,
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/coins1.png"))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: size.height/50,),
                Divider(height: 0.1, thickness: 0.3, color: Colors.white,),
                SizedBox(height: size.height/40,),
                Container(
                  height: size.height/3,
                  width: size.width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemBuilder: (context, index){
                      return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        image: const DecorationImage(
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1608755727748-dfa2e44f255b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGdpZnR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                            fit: BoxFit.cover)),
                  ),
              );
                  }),
                ),
                SizedBox(height: size.height/10,),
                InkWell(
                  onTap: (){
                    Navigator.push(
                              context,
                              PageTransition(
                                child: const Coins(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            );
                  },
                  child: Container(
                        height: size.height/20,
                        width: size.width/4,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text("BUY NOW", style: TextStyle(color: Colors.white, fontSize: 12),),
                      ),
                )
              ],
            ),
          ),
        );
      }))
    );
  }
}