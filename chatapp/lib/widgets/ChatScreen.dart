import 'package:chatapp/model/message.dart';
import 'package:flutter/material.dart';
import './MessageItem.dart';


class ChatScreen extends StatelessWidget {
  final String name;
  final String channelId;
  final List<Message> messages;
  ChatScreen({this.name, this.channelId, this.messages});
  @override
  Widget build(BuildContext context) {
    return Container(
            width: 370,
            height: 570,
            child: Padding(
                padding: EdgeInsets.only(left:10, top: 10),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) =>
                    MessageItem(
                      userId: messages[index].userId,
                      message: messages[index].message
                      )
                )
              ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 10),
                  blurRadius: 12)
               ]),
            );
  }
}