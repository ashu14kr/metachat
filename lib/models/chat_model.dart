class ChatModel {
  String? name;
  String? icon;
  String? time;
  String? currentmessage;
  String? status;
  bool select = false;
  String? id;

  ChatModel({
    this.name,
    this.icon,
    this.time,
    this.currentmessage,
    this.status,
    this.select = false,
    this.id,
  });
}