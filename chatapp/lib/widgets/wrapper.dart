import 'package:chatapp/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/authenticate.dart';
import 'package:chatapp/model/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);

    //return either Home or Authenticate
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}