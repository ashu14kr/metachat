import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/controllers/call.dart';
import 'package:metachat/models/calls.dart';

import '../../../../constant.dart';
import '../customcallscreen.dart';

class PickUpScreen extends StatelessWidget {
  final CallModel callModel;
  const PickUpScreen({
    Key? key,
    required this.callModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final callController = Get.put(CallController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Incoming...",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            CircleAvatar(
              backgroundImage: NetworkImage(
                  link + "/uploads/" + callModel.callerPic.toString()),
              radius: 100,
            ),
            SizedBox(height: 25),
            Text(
              callModel.callerName.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () async {
                    await callController.endCall(callModel: callModel);
                  },
                  child: Icon(Icons.call_end, color: Colors.white,),
                ),
                SizedBox(width: 50),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () async {
                    await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomCallScreen(
                        callModel: callModel,
                      ),
                    ),
                  );
                  },
                  child: Icon(Icons.call, color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
