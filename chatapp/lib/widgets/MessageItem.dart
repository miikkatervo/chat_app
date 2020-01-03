import 'package:flutter/material.dart';
import '../model/user.dart';

class MessageItem extends StatelessWidget {
  final String userId;
  final String message;
  MessageItem({this.userId, this.message});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          users.username,
          style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 18,
              color: Color.fromRGBO(
                  users.color[0], users.color[1], users.color[2], 1.0)),
        ),
        Text(
          ":",
          style: TextStyle(
              fontFamily: 'Nunito', fontSize: 18, color: Colors.black),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5),
        ),
        Expanded(
          child: Text(
                  message,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      color: Colors.grey[800]),
                ),
        )
      ],
    );
  }
}
