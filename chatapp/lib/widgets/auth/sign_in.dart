import 'package:chatapp/services/auth.dart';
import 'package:chatapp/widgets/Loading.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
                backgroundColor: Colors.blue[500],
                appBar: AppBar(
                  backgroundColor: Colors.purple[600],
                  elevation: 0.0,
                  title: Text('Sign in to Kannel'),
                ),
                body: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlineButton(
                            splashColor: Colors.grey,
                            onPressed: () async {
                              print('signed in');
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithGoogle();
                                if (result == null) {
                                  print('error signing in');
                                  loading = false;
                                }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            highlightElevation: 0,
                            borderSide: BorderSide(color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Image(
                                      image: AssetImage("assets/images/google_logo.png"),
                                      height: 35.0),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      'Sign in with Google',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: RaisedButton(
                              child: Text('Sign in anon'),
                              onPressed: () async {
                                setState(() => loading = true);
                                dynamic result = await _auth.signInAnon();
                                if (result == null) {
                                  print('error signing in');
                                  loading = false;
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ))));
  }
}
