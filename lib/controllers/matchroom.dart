import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/models/matchroom.dart';
import 'package:http/http.dart' as http;

class MatchRoomController extends GetxController {
  Rx<List<MatchRoom>> rooms = Rx<List<MatchRoom>>([]);
  final uid = FirebaseAuth.instance.currentUser!.uid;

  Future<List<MatchRoom>> createRoom({required String channelId}) async {
    final dio = Dio();
    try {
      final resposone = await dio.post(link + "/room/create/", data: {
        "_id": uid,
        "creatorId": uid,
        "connectorId": uid,
        "channelId": channelId,
        "isAvailable": true,
        "status": 0
      });
      if(resposone.statusCode == 200){
        rooms.value = matchRoomFromJson(resposone.data);
      }
      return rooms.value;
    } catch (e) {
      print(e);
      return rooms.value;
    }
  }

  Future makematch({required String id,required String connectorId,}) async {
    final dio = Dio();
    try {
      await dio.patch(
        link + "/room/makematch/?_id=$id",
        data: {"connectorId": connectorId, "isAvailable": false, "status": 1},
      );
    } catch (e) {
      print(e);
    }
  }

  Future readyForMatch({required String id,}) async {
    final dio = Dio();
    try {
      await dio.patch(
        link + "/room/makematch/?_id=$id",
        data: {"connectorId": id, "isAvailable": true, "status": 0},
      );
    } catch (e) {
      print(e);
    }
  }

  Future<List<MatchRoom>> getmatch() async {
    final url = Uri.parse(link + "/room/check/");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        rooms.value = matchRoomFromJson(response.body);
        return rooms.value;
      }
      return rooms.value;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<List<MatchRoom>> getmatchById(String id) async {
    final url = Uri.parse(link + "/room/checkById/?_id=$id");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        rooms.value = matchRoomFromJson(response.body);
        return rooms.value;
      }
      return rooms.value;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
