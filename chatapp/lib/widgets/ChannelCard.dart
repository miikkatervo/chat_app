import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  final String imgURL;
  ChannelCard({this.imgURL});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18),
      child: Container(
        width: 165,
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 75),
                child: Container(
                  width: 150,
                  height: 200,
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
              ),
            ),
            Positioned(
              right:  30,
              top: 105,
              child: Image.asset(imgURL, width: 100, height: 120),
            ),
          ],
        ),
      ),
    );
  }
}
