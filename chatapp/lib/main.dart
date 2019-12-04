import 'package:flutter/material.dart';
import 'model/model.dart';
import 'widgets/ChannelCard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatApp',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Nunito',
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

List<int> colorCode = <int>[256, 246, 203];

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      color: Colors.amber[100],
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                color: Colors.grey[50],
              ),
              new Container(
                color: Colors.grey[50],
                child: Column(
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 60
                    ),
                    child: Text(
                      "Kannel",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: 'Nunito'
                      ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 90,
                      right: 220
                    ),
                    child: Text(
                      "Kanavat",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 35
                      ),
                      ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 0
                    ),
                    child: Container(
                      width: double. infinity,
                      height: 350,
                      color: Colors.grey[50],
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          var channel = channels[index];
                          return ChannelCard(
                            imgURL: channel.image,
                            name: channel.name
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                      ),
                    ),
                  ),
                  
                  ],
                ),
                
              ),   
              new Container(
                color: Colors.grey[50],
              )],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.search),
              ),
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
              )
            ], 
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red[200],
          ),
          backgroundColor: Colors.brown[400]
        ),
      ),
    );
  }
}

