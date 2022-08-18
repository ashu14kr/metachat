import 'package:flutter/material.dart';
import 'package:metachat/widget/button_text.dart';

import '../../color.dart';

class CreditScreen extends StatelessWidget {
  const CreditScreen({Key? key}) : super(key: key);


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
    content: Text("Do you want to Exchange 25 Credits for 1 coin?"),
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
        title: const Text("Credits"),
        centerTitle: true,
        foregroundColor: foreground,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(height: size.height/20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Credit Balance"),
                Text("500")
              ],
            ),
            SizedBox(height: size.height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Coin Balance"),
                Row(
                  children: [
                    Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/coins1.png"))
                  )),
                    Text("20", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                  ],
                )
              ],
            ),
            SizedBox(height: size.height/30,),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.pink,
            ),
            SizedBox(height: size.height/40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Exchange to coin"),
                Text("25credits = 1coin", style: TextStyle(color: Colors.pink),)
              ],
            ),
            SizedBox(height: size.height/20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                  height: 40,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black)
                  ),
                  child: Text("25", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                ),
                  ],
                ),
                SizedBox(width: size.width/30,),
                const Text("credit", style: TextStyle(color: Colors.black),),
                Icon(Icons.arrow_forward, color: Colors.pink, size: 25,),
                Container(
                  height: 40,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.pink)
                  ),
                  child: Text("1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.pink),),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/coins1.png"))
                  )),
              ],
            ),
            SizedBox(height: size.height/20,),
            ButtonText(btnname: "Exchange", ontap: (){
              showAlertDialog(context);
            })
          ],
        ),
      ),
    );
  }
}