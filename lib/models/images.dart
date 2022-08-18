import 'dart:convert';

List<ImgModel> imgModelFromJson(String str) => List<ImgModel>.from(json.decode(str).map((x) => ImgModel.fromJson(x)));

String imgModelToJson(List<ImgModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImgModel {
    ImgModel({
        required this.id,
        required this.img,
        required this.v,
    });

    String id;
    String img;
    int v;

    factory ImgModel.fromJson(Map<String, dynamic> json) => ImgModel(
        id: json["_id"],
        img: json["img"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "img": img,
        "__v": v,
    };
}
