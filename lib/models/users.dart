import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        required this.id,
        required this.name,
        required this.nickname,
        required this.email,
        required this.phoneno,
        required this.profileimg,
        required this.location,
        required this.gender,
        required this.status,
        required this.interests,
        required this.levels,
        required this.oath,
        required this.dob,
        required this.height,
        required this.weight,
        required this.language,
        required this.haircolor,
        required this.v,
    });

    String id;
    String name;
    String nickname;
    String email;
    String phoneno;
    String profileimg;
    String location;
    String gender;
    String status;
    List<String> interests;
    String levels;
    String oath;
    String dob;
    String height;
    String weight;
    String language;
    String haircolor;
    int v;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        nickname: json["nickname"],
        email: json["email"],
        phoneno: json["phoneno"],
        profileimg: json["profileimg"],
        location: json["location"],
        gender: json["gender"],
        status: json["status"],
        interests: List<String>.from(json["interests"].map((x) => x)),
        levels: json["levels"],
        oath: json["Oath"],
        dob: json["dob"],
        height: json["height"],
        weight: json["weight"],
        language: json["language"],
        haircolor: json["haircolor"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "nickname": nickname,
        "email": email,
        "phoneno": phoneno,
        "profileimg": profileimg,
        "location": location,
        "gender": gender,
        "status": status,
        "interests": List<dynamic>.from(interests.map((x) => x)),
        "levels": levels,
        "Oath": oath,
        "dob": dob,
        "height": height,
        "weight": weight,
        "language": language,
        "haircolor": haircolor,
        "__v": v,
    };
}
