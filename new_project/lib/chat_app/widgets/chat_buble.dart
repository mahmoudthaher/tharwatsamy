import 'package:flutter/material.dart';
import 'package:new_project/chat_app/Constants.dart';
import 'package:new_project/chat_app/models/message_model.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 32,
        ),
        Align(
          //اذا حطيت رو ما في حاجة الها
          alignment: Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width - 32 * 2 - 20),
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
            decoration: const BoxDecoration(
              color: KPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Text(
              messageModel.message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({super.key, required this.messageModel});
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        decoration: const BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        child: Text(
          messageModel.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
