import 'package:flutter/material.dart';
import '../model/message.dart';

class MessageItem extends StatelessWidget {
  final String user;
  final String message;
  final List<int> color;
  MessageItem({this.user, this.message, this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
                  children: <Widget>[
                    Text(
                      user,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: Color.fromRGBO(color[0], color[1], color[2], 1.0)
                      ),
                    ),
                    Text(
                      ":",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: Colors.black
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                    ),
                    Text(
                      message,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        color: Colors.grey[800]
                      ),
                    ),
                  ],
                );
  }
}

class ChatScreen extends StatelessWidget {
  final String name;
  ChatScreen({this.name});
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
                      user: messages[index].user,
                      message: messages[index].message,
                      color: messages[index].color
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