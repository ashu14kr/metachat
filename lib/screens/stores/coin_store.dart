import 'package:flutter/material.dart';

import '../../color.dart';

class Coins extends StatelessWidget {
  const Coins({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("No"),
    onPressed:  () {},
  );
  Widget continueButton = TextButton(
    child: Text("Yes"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
    content: Text("Do you want to buy 50 coins for ₹99.00?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Coin Store"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Container(
              height: size.height/11.5,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(image: AssetImage("assets/images/refferal.png"), fit: BoxFit.cover)
              ),
            ),
            SizedBox(
                height: size.height / 40,
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My Balance: ", style: TextStyle(color: languagetextcolor, fontWeight: FontWeight.w600, fontSize: 16),),
                  Row(
                    children: [
                      Text("20 ", style: TextStyle(color: languagetextcolor, fontWeight: FontWeight.w600, fontSize: 18),),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/icons/coin.png"))
                    ),
                  ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                height: size.height / 40,
              ),
            const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    SizedBox(
                    height: size.height / 60,
                  ),
                  BuyCoins(size: size, img: 'assets/images/coins1.png', coins: '50', price: '₹99.00', click: () {
                    // showAlertDialog(context);
                  },),
                  SizedBox(
                    height: size.height / 60,
                  ),
                  const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
                    height: size.height / 60,
                  ),
                  BuyCoins(size: size, img: 'assets/images/coins2.png', coins: '150', price: '₹599.00', click: () {
                    // showAlertDialog(context);
                  },),
                  SizedBox(
                    height: size.height / 60,
                  ),
                  const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
                    height: size.height / 60,
                  ),
                  BuyCoins(size: size, img: 'assets/images/coins3.png', coins: '1000', price: '₹2099.00', click: () {
                    // showAlertDialog(context);
                  },),
                  SizedBox(
                    height: size.height / 60,
                  ),
                  const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
                    height: size.height / 60,
                  ),
                  BuyCoins(size: size, img: 'assets/images/coins4.png', coins: '5000', price: '₹8099.00', click: () {
                    // showAlertDialog(context);
                  },),
                  SizedBox(
                    height: size.height / 60,
                  ),
                  const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            SizedBox(
                    height: size.height / 60,
                  ),
                  BuyCoins(size: size, img: 'assets/images/coins5.png', coins: '10000', price: '₹20999.00', click: () {
                    // showAlertDialog(context);
                  },),
                  SizedBox(
                    height: size.height / 60,
                  ),
                  const Divider(
              height: 0.5,
              thickness: 0.5,
              color: Colors.grey,
            ),
            
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

class BuyCoins extends StatelessWidget {
  const BuyCoins({
    Key? key,
    required this.size, required this.img, required this.coins, required this.price, required this.click,
  }) : super(key: key);

  final Size size;
  final String img;
  final String coins;
  final String price;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover)
          )
        ),
        SizedBox(
      width: size.width / 10,
    ),
        Text("$coins coins", style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),),
          ],
        ),
        InkWell(
          onTap: click,
          child: Container(
            height: size.height/25,
            width: size.width/4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.pink
            ),
            child: Text(price, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 15),),
          ),
        )
      ],
    );
  }
}