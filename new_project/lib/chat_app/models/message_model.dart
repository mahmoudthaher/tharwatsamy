import 'package:new_project/chat_app/Constants.dart';

class MessageModel {
  final String message;
  final String id;

  MessageModel(this.message, this.id);

  factory MessageModel.fromJson(json) {
    return MessageModel(json[KMessage], json['id']);
  }
}
