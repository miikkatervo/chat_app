import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Chatapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      color: Colors.yellow,
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                color: Colors.pink[50],
              ),
              new Container(
                color: Colors.white,
                ),
              new Container(
                color: Colors.teal[50],
              ),
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.settings),
              ),
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              )
            ], 
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red[200],
          ),
          backgroundColor: Colors.cyan[100],
        ),
      ),
    );
  }
}