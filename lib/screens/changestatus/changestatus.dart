import 'package:flutter/material.dart';

import '../../color.dart';

class ChangeStatusScreen extends StatelessWidget {
  const ChangeStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Change Status"),
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
              children: [
                Container(
                  height: size.height/15,
                  width: size.width/2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("Available", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
                Switch(value: true, onChanged: (val){}, activeColor: languagetextcolor,)
              ],
            ),
            SizedBox(height: size.height/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height/15,
                  width: size.width/2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 208, 191, 42),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("Busy", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
                Switch(value: false, onChanged: (val){}, activeColor: languagetextcolor,)
              ],
            ),
            SizedBox(height: size.height/50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height/15,
                  width: size.width/2.5,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 246, 86, 75),
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Text("Offline", style: TextStyle(color: Colors.white, fontSize: 18),),
                ),
                Switch(value: false, onChanged: (val){}, activeColor: languagetextcolor,)
              ],
            )
          ],
        ),
      ),
    );
  }
}