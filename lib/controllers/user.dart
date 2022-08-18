import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/models/users.dart';

class UserController extends GetxController {

  Rx<List<UserModel>> user = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> userByGender = Rx<List<UserModel>>([]);
  Rx<List<UserModel>> userByStatus = Rx<List<UserModel>>([]);

  Future postuserdata(String id, String name, String nickname, String phoneno, String email, File profileimg, String location, String gender, String status, var interest,) async {
    var dio = Dio();
    try {
      Response response = await dio.post(link+"/alluser/", data: FormData.fromMap({
        "_id": id,
        "name": name,
        "nickname": nickname,
        "email": email,
        "phoneno": phoneno,
        "profileImg": await MultipartFile.fromFile(profileimg.path),
        "location": location,
        "gender": gender,
        "status": status,
        "interests": interest,
        "levels": "level-0",
        "Oath": "unfilled",
        "dob": "dd/mm/yyyy",
        "height": "unfilled",
        "weight": "unfilled",
        "language": "unfilled",
        "haircolor": "unfilled",
      }));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }




  Future<List<UserModel>?> getUser(String id) async {
    final url = Uri.parse(link+"/allusers/?_id=$id");
    try {
      final response = await http.get(url);
    if(response.statusCode == 200){
      user.value = userModelFromJson(response.body); 
      // return user.value;
    }else{
      throw Exception("data not found");
    }
    } catch (e) {
      print("hello $e");
    }
    return user.value;
  }


  Future<List<UserModel>?> getUserByGender(String gender) async {
    final url = Uri.parse(link+"/allusersbygender/?gender=$gender");
    try {
      final response = await http.get(url);
    if(response.statusCode == 200){
      userByGender.value = userModelFromJson(response.body); 
      // return user.value;
    }else{
      throw Exception("data not found");
    }
    } catch (e) {
      print(e);
    }
    return userByGender.value;
  }


  Future<List<UserModel>?> getUserByStatus(String status) async {
    final url = Uri.parse(link+"/allusersbystatus/?status=$status");
    try {
      final response = await http.get(url);
    if(response.statusCode == 200){
      userByStatus.value = userModelFromJson(response.body); 
      // return user.value;
    }else{
      throw Exception("data not found");
    }
    } catch (e) {
      print(e);
    }
    return userByStatus.value;
  }




  Future changeUserStatus({required String id, required String status}) async {
    final dio = Dio();
    try {
      await dio.patch(
        link + "/changestatus/?_id=$id",
        data: {"status": status},
      );
    } catch (e) {
      print(e);
    }
  }
}