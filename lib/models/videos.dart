import 'dart:convert';

List<VideoModel> videoModelFromJson(String str) => List<VideoModel>.from(json.decode(str).map((x) => VideoModel.fromJson(x)));

String videoModelToJson(List<VideoModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoModel {
    VideoModel({
        required this.id,
        required this.uid,
        required this.video,
        required this.v,
    });

    String id;
    String uid;
    String video;
    int v;

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json["_id"],
        uid: json["uid"],
        video: json["video"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "uid": uid,
        "video": video,
        "__v": v,
    };
}
