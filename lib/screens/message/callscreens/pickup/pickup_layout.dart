import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metachat/models/calls.dart';
import 'package:metachat/screens/message/callscreens/pickup/pickup_screen.dart';

import '../../../../controllers/call.dart';

class PickupLayout extends StatefulWidget {
  final Widget scaffold;
  const PickupLayout({Key? key, required this.scaffold}) : super(key: key);

  @override
  State<PickupLayout> createState() => _PickupLayoutState();
}

class _PickupLayoutState extends State<PickupLayout> {

  final callController = Get.put(CallController());
  final uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: callController.stremcall(uid),
      builder: (context,AsyncSnapshot<List<CallModel>?> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if (snapshot.data?.length != 0 && snapshot.data!.first.callerId != uid) {
          CallModel call = CallModel(
            id: snapshot.data!.first.id,
            callerId: snapshot.data!.first.callerId,
            callerName: snapshot.data!.first.callerName,
            callerPic: snapshot.data!.first.callerPic,
            receiverId: snapshot.data!.first.receiverId,
            receiverName: snapshot.data!.first.receiverName,
            receiverPic: snapshot.data!.first.receiverPic,
            channelId: snapshot.data!.first.channelId,
            hasDialled: snapshot.data!.first.hasDialled,
            v: snapshot.data!.first.v,
          );
            return PickUpScreen(callModel: call);
          }else{
            return widget.scaffold;
          }
    });
  }
}