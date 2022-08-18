import 'dart:convert';

List<CallModel> callModelFromJson(String str) => List<CallModel>.from(json.decode(str).map((x) => CallModel.fromJson(x)));

String callModelToJson(List<CallModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CallModel {
    CallModel({
        this.id,
        this.callerId,
        this.callerName,
        this.callerPic,
        this.receiverId,
        this.receiverName,
        this.receiverPic,
        this.channelId,
        this.hasDialled,
        this.v,
    });

    String? id;
    String? callerId;
    String? callerName;
    String? callerPic;
    String? receiverId;
    String? receiverName;
    String? receiverPic;
    String? channelId;
    bool? hasDialled;
    int? v;

    factory CallModel.fromJson(Map<String, dynamic> json) => CallModel(
        id: json["_id"],
        callerId: json["callerId"],
        callerName: json["callerName"],
        callerPic: json["callerPic"],
        receiverId: json["receiverId"],
        receiverName: json["receiverName"],
        receiverPic: json["receiverPic"],
        channelId: json["channelId"],
        hasDialled: json["hasDialled"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "callerId": callerId,
        "callerName": callerName,
        "callerPic": callerPic,
        "receiverId": receiverId,
        "receiverName": receiverName,
        "receiverPic": receiverPic,
        "channelId": channelId,
        "hasDialled": hasDialled,
        "__v": v,
    };
}
