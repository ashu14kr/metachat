import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';
import 'package:metachat/models/connection.dart';
import 'package:http/http.dart' as http;
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../constant.dart';
import '../models/message_model.dart';

class ChatController extends GetxController {
  IO.Socket? socket;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  Rx<List<ConnectionModel>> connection = Rx<List<ConnectionModel>>([]);
  Rx<List<ConnectionModel>> getChatingConnections =
      Rx<List<ConnectionModel>>([]);
  Rx<List<MessageModel>> messages = Rx<List<MessageModel>>([]);

  void connects() {
    try {
      socket = IO.io("http://192.168.29.121:3000", <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": false,
      });
      socket!.connect();
      socket!.emit("signin", uid);
      socket!.onConnect((data) {
        socket!.on("msg", (msg) {
        print(messages);
        setMessage("destination", msg["message"]);
        EasyLoading.showToast("good!!");
      });
      });
      // print(socket!.id);
      socket!.onConnectError((data) => print(data));
      socket!.onError((data) => print(data));
      socket!.onConnectTimeout((data) => print(data));
    } catch (e) {
      print(e);
    }
  }


  void sendMessage({required String msg, required String sourceId, required String targetId}) {
    try {
      setMessage("source", msg);
      socket!.emit("msg", {
        "message":msg,
        "sourceId": sourceId,
        "targetId": targetId
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<ConnectionModel>> getChats() async {
    final url = Uri.parse(
        "http://192.168.29.121:3000/connect/connection/etablished1/?ownerId=$uid");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        getChatingConnections.value = connectionModelFromJson(response.body);
        return getChatingConnections.value;
      }
      return getChatingConnections.value;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Stream<List<ConnectionModel>?> stremchats() =>
      Stream.periodic(Duration(seconds: 1)).asyncMap((_) => getChats());

  Future makeConnection({required String connectedId, required String name,
      required String img,
      required String lastmsg}) async {
    await postConnection(ownerId: uid, connectedId: connectedId, name: name, img: img, lastmsg: lastmsg);
    await postConnection(ownerId: connectedId, connectedId: uid, name: name, img: img, lastmsg: lastmsg);
  }

  Future postConnection(
      {required String ownerId,
      required String connectedId,
      required String name,
      required String img,
      required String lastmsg}) async {
    final dio = Dio();
    try {
      await dio.post(link + "/connect/connection/etablish/", data: {
        "connectedId": connectedId,
        "connectedName": name,
        "connectedImg": img,
        "lastMessage": lastmsg,
        "ownerId": ownerId
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List<ConnectionModel>> getConnection(String connectedId) async {
    final url = Uri.parse(link +
        "/connect/connection/etablished/?connectedId=$connectedId&ownerId=$uid");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        connection.value = connectionModelFromJson(response.body);
        print(response.body);
        return connection.value;
      }
      print(response.body);
      return connection.value;
    } catch (e) {
      print(e);
      return [];
    }
  }


  setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(
        type: type,
        message: message,);
    messages.value.add(messageModel);
    messages.refresh();
  }
}
