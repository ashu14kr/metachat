import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/models/videos.dart';

import '../models/images.dart';

class MediaController extends GetxController{
  Rx<List<VideoModel>> video = Rx<List<VideoModel>>([]);
  Rx<List<ImgModel>> image = Rx<List<ImgModel>>([]);

  Future postVideo(File video, String uid) async {
    var dio = new Dio();
    try {
      Response response = await dio.post(link+"/video/alluservideo/", data: FormData.fromMap({
        "uid": uid,
        "video": await MultipartFile.fromFile(video.path)
      }));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future postImgs(File image, String uid) async {
    var dio = new Dio();
    try {
      Response response = await dio.post(link+"/imgs/alluserimg/", data: FormData.fromMap({
        "uid": uid,
        "userimgs": await MultipartFile.fromFile(image.path)
      }));
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  Future<List<VideoModel>?> getvideosById(String id) async{
    final url = Uri.parse(link+"/video/allusersvide/?uid=$id");
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        video.value = videoModelFromJson(response.body);
      }else{
        throw Exception("data not found");
      }
    } catch (e) {
      print(e);
    }
    return video.value;
  }

  Future<List<ImgModel>?> getimgsById(String id) async{
    final url = Uri.parse(link+"/imgs/allusersimgs/?uid=$id");
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        image.value = imgModelFromJson(response.body);
      }else{
        throw Exception("data not found");
      }
    } catch (e) {
      print(e);
    }
    return image.value;
  }


  Future<List<VideoModel>?> getvideos() async{
    final url = Uri.parse(link+"/video/allusersvideos/");
    try {
      final response = await http.get(url);
      if(response.statusCode == 200){
        video.value = videoModelFromJson(response.body);
      }else{
        throw Exception("data not found");
      }
    } catch (e) {
      print(e);
    }
    return video.value;
  }
}