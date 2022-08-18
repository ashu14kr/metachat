import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:get/state_manager.dart';
import 'package:metachat/constant.dart';
import 'package:metachat/models/calls.dart';

class CallController extends GetxController {
  Rx<List<CallModel>> call = Rx<List<CallModel>>([]);

  Future<bool> makecall({CallModel? callModel}) async {
    try {
      final dio = Dio();
      await dio.post(link + "/calls/activecalls/", data: {
        "_id": callModel!.callerId,
        "callerId": callModel.callerId,
        "callerName": callModel.callerName,
        "callerPic": callModel.callerPic,
        "receiverId": callModel.receiverId,
        "receiverName": callModel.receiverName,
        "receiverPic": callModel.receiverPic,
        "channelId": callModel.channelId,
        "hasDialled": true
      });
      await dio.post(link + "/calls/activecalls/", data: {
        "_id": callModel.receiverId,
        "callerId": callModel.callerId,
        "callerName": callModel.callerName,
        "callerPic": callModel.callerPic,
        "receiverId": callModel.receiverId,
        "receiverName": callModel.receiverName,
        "receiverPic": callModel.receiverPic,
        "channelId": callModel.channelId,
        "hasDialled": false
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> endCall({CallModel? callModel}) async {
    try {
      final dio = Dio();
      await dio.delete(
          link + "/calls/deleteactivecalls/?_id=${callModel!.callerId}");
      await dio.delete(
          link + "/calls/deleteactivecalls/?_id=${callModel.receiverId}");
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<CallModel>> getcall(String uid) async {
    try {
      final url = Uri.parse(link + "/calls/activecalls/?_id=$uid");
      final response = await http.get(url);
      if(response.statusCode == 200){
        call.value = callModelFromJson(response.body);
      }else{
        throw Exception("data not found");
      }
      return call.value;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<List<CallModel>?> stremcall(String uid) => Stream.periodic(Duration(seconds: 1)).asyncMap((_) => getcall(uid));
}
