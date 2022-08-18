import 'dart:convert';

List<MatchRoom> matchRoomFromJson(String str) => List<MatchRoom>.from(json.decode(str).map((x) => MatchRoom.fromJson(x)));

String matchRoomToJson(List<MatchRoom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MatchRoom {
    MatchRoom({
        required this.id,
        required this.creatorId,
        required this.connectorId,
        required this.channelId,
        required this.isAvailable,
        required this.status,
        required this.v,
    });

    String id;
    String creatorId;
    String connectorId;
    String channelId;
    bool isAvailable;
    int status;
    int v;

    factory MatchRoom.fromJson(Map<String, dynamic> json) => MatchRoom(
        id: json["_id"],
        creatorId: json["creatorId"],
        connectorId: json["connectorId"],
        channelId: json["channelId"],
        isAvailable: json["isAvailable"],
        status: json["status"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "creatorId": creatorId,
        "connectorId": connectorId,
        "channelId": channelId,
        "isAvailable": isAvailable,
        "status": status,
        "__v": v,
    };
}
