import 'package:flutter/material.dart';


class ChannelRoute extends StatefulWidget {
  ChannelRoute({Key key, this.title, this.name}) : super(key: key);

  final String title;
  final String name;

  @override
  _ChannelState createState() => _ChannelState(name);
}

class _ChannelState extends State<ChannelRoute> {
  final String name;
  _ChannelState(this.name);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.amber[200],
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
                        fontSize: 35
                      ),
                    ),    
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Container(
            width: 370,
            height: 570,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 10),
                  blurRadius: 12)
               ]),
            ),
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
              padding: EdgeInsets.only(top:15, left: 10),
                child: Text(
                "Write here...",
                style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        color: Colors.grey[600]
                      ),
              )
            ),
          )
        ],
      )
    );
  }
      
}