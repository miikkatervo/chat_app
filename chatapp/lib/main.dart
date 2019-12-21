import 'package:flutter/material.dart';
import 'model/channel.dart';
import 'widgets/ChannelCard.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) {
    runApp(MyApp());
  });
}

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
var plus = 50;
List<int> midnightNavy = <int>[20+plus, 40+plus, 60+plus];

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      
      color: Colors.green[50],
      home: DefaultTabController(
        length: 3,
        child: new Scaffold(
          body: TabBarView(
            children: [
              new Container(
                color: Color.fromRGBO(midnightNavy[0], midnightNavy[1], midnightNavy[2], 1.0),
              ),
              new Container(
                color: Color.fromRGBO(midnightNavy[0], midnightNavy[1], midnightNavy[2], 1.0),
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
                      color: Color.fromRGBO(midnightNavy[0], midnightNavy[1], midnightNavy[2], 1.0),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          var channel = channels[index];
                          return ChannelCard(
                            id: channel.id,
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
                child: (
                new Scaffold(
                  backgroundColor: Colors.green[50],
                  endDrawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.only(top:50),
                      children: <Widget>[

                        ListTile(
                          title: Text('Käyttöehdot',
                           style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Nunito'
                            ),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                        ListTile(
                          title: Text('Kirjaudu ulos',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Nunito'
                            ),
                          ),
                          onTap: () {
                            // Update the state of the app.
                            // ...
                          },
                        ),
                      ],
                    ),
                  ),
                  drawerEdgeDragWidth: 0,
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 100, 10, 600),
                      child: new Builder(builder:(context) {
                        return new FloatingActionButton(
                          mini: false,
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green[500],
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        child: new Icon(Icons.settings),
                      );
                      

                 }),
                ))
              )
            ),
          ]),
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
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.red[200],
          ),
          backgroundColor: Colors.blue[100]
        ),
      ),
    );
  }
}

