import 'package:flutter/material.dart';


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
