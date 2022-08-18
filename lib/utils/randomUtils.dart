import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:metachat/controllers/user.dart';

class RandomUtils {

  UserController _userController = Get.put(UserController());
  final uid = FirebaseAuth.instance.currentUser!.uid;

  checkUserStatus()async{
   final _result =  await InternetConnectionChecker().hasConnection;
   if(_result == true){
    _userController.changeUserStatus(id: uid, status: "Online");
    return;
   }else{
    _userController.changeUserStatus(id: uid, status: "Offline");
   }
  }

  userNotAvaliable(){
    _userController.changeUserStatus(id: uid, status: "Offline");
  }


}