import 'package:flutter/material.dart';
import './ChatScreen.dart';
import  'package:keyboard_actions/keyboard_actions.dart';
import '../model/message.dart';
import '../model/user.dart';



class ChannelRoute extends StatefulWidget {
  ChannelRoute({Key key, this.title, this.name, this.id}) : super(key: key);

  final String title;
  final String name;
  final String id;

  @override
  _ChannelState createState() => _ChannelState(name, id);
}


class _ChannelState extends State<ChannelRoute> {
  final String name;
  final String id;
  final FocusNode _nodeText = FocusNode();
  TextEditingController messageController = new TextEditingController();
  var messages = [
  Message(id:"0", userId: users.id,  message: "Rakastan temppareita <33", channelId: "0"),
  Message(id:"1", userId: users.id,  message: "Miksi kukaan ei vastaa? :'(", channelId: "1")
  ];

  _ChannelState(this.name, this.id);

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: _nodeText,
          onTapAction: () {
            messages.insert(messages.length, Message(id: (messages.length).toString(), userId: users.id,  message: messageController.text, channelId: id));
            messageController.clear();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: _buildConfig(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.blue[400], Colors.purple[900]] )
            ),
        child: Column(
        children: <Widget>[
          Container(
            height: 100,
             decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors:[Colors.blue[400], Colors.purple[900]] )
                ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                      child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                      ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 35),
                ),
                Container(
                    height: 50,
                    width: 200,
                    alignment: Alignment.center,      
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 35,
                        color: Colors.white
                      ),
                    ),    
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          ChatScreen(name: name, channelId: id, messages: messages),
          Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Container(
            height: 50,
            width: 370,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 10),
                  blurRadius: 12)
               ]),
            child: Padding(
              padding: EdgeInsets.only(top:10, left: 10),
                child: TextField(
                  controller: messageController,
                  keyboardType: TextInputType.text,
                  focusNode: _nodeText,
                  decoration: InputDecoration(
                    hintText: "Write here...",
                  ),
              )
            ),
          )
        ],
      )
    ));
  }
      
}

