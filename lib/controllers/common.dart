import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:metachat/controllers/user.dart';
import 'package:metachat/models/token.dart';

import '../constant.dart';
import '../models/users.dart';
import 'matchroom.dart';

class CommonController extends GetxController {
  final _picker = ImagePicker();
  var image = File("").obs;
  var video = File("").obs;
  final pick = false.obs;
  final vidpick = false.obs;
  final roomcloase = false.obs;
  Rx<List<UserModel>> user = Rx<List<UserModel>>([]);
  final matchController = Get.put(MatchRoomController());
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final userController = Get.put(UserController());

  Future pickImg(ImageSource source) async {
    final XFile? img = await _picker.pickImage(source: source);
    if (img != null) {
      final tempimg = File(img.path);
      image.value = tempimg;
      print(image.value);
      pick.value = true;
    } else {
      pick.value = false;
    }
  }

  Future pickVideo(ImageSource source) async {
    final XFile? vid = await _picker.pickVideo(
        source: source, maxDuration: Duration(seconds: 60));
    if (vid != null) {
      final tempimg = File(vid.path);
      video.value = tempimg;
      print(video.value);
      vidpick.value = true;
    } else {
      vidpick.value = false;
    }
  }


  checkprofileId(String id) {
    try {
      matchController.getmatch().then((h)  {
      if(h.length != 0) {
         matchController.getmatchById(id).then((element) {
      if (element.first.status == 1) {
        if(element.first.connectorId != uid){
          userController.getUser(element.first.connectorId).then((a) {
          user.value = a!;
        });
        }
        else if(element.first.creatorId != uid){
          userController.getUser(element.first.creatorId).then((b) {
          user.value = b!;
        });
        }
        roomcloase.value = true;
        // EasyLoading.showToast("hello ${user.value}");
        return;
      } else {
        checkprofileId(id);
        roomcloase.value = false;
        // EasyLoading.showToast("hello404");
      }
    });
      }else{
        checkprofileId(id);
        roomcloase.value = false;
        // EasyLoading.showToast("hello505");
      }
    });
    } catch (e) {
      print("hellohhh $e");
    }
  }

  Future<TokenModel> getToken(String channel) async {
    final url = Uri.parse(link+"/agora/access_token?channelName=$channel&role=publisher&expiryTime=60");
    try {
      final response = await http.get(url);
      TokenModel token = tokenModelFromJson(response.body);
      return token;
    } catch (e) {
      print(e);
      return TokenModel(token: "");
    }
  }
}
