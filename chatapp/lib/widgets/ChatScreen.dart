import 'package:flutter/material.dart';
import '../model/message.dart';
import '../model/user.dart';
//import '../model/channel.dart';
import './MessageItem.dart';

var messages = [
  Message(id:"0", userId: users.id,  message: "Rakastan temppareita <33", channelId: "0"),
  Message(id:"1", userId: users.id,  message: "Miksi kukaan ei vastaa? :'(", channelId: "1")
];

class ChatScreen extends StatelessWidget {
  final String name;
  final String channelId;
  ChatScreen({this.name, this.channelId});
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