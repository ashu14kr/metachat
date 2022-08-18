import 'dart:convert';

List<ConnectionModel> connectionModelFromJson(String str) => List<ConnectionModel>.from(json.decode(str).map((x) => ConnectionModel.fromJson(x)));

String connectionModelToJson(List<ConnectionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConnectionModel {
    ConnectionModel({
        required this.id,
        required this.connectedId,
        required this.connectedName,
        required this.connectedImg,
        required this.lastMessage,
        required this.ownerId,
        required this.v,
    });

    String id;
    String connectedId;
    String connectedName;
    String connectedImg;
    String lastMessage;
    String ownerId;
    int v;

    factory ConnectionModel.fromJson(Map<String, dynamic> json) => ConnectionModel(
        id: json["_id"],
        connectedId: json["connectedId"],
        connectedName: json["connectedName"],
        connectedImg: json["connectedImg"],
        lastMessage: json["lastMessage"],
        ownerId: json["ownerId"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "connectedId": connectedId,
        "connectedName": connectedName,
        "connectedImg": connectedImg,
        "lastMessage": lastMessage,
        "ownerId": ownerId,
        "__v": v,
    };
}
