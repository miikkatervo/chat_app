import 'package:flutter/material.dart';
import 'model/channel.dart';
import 'widgets/ChannelCard.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var platformHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      color: Colors.green[50],
      home: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: new SafeArea(
            child: new Scaffold(
                body: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.blue[400],
                          Colors.purple[900]
                        ])),
                      ),
                      new Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Colors.blue[400],
                          Colors.purple[900]
                        ])),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25, top: 25, right: 35),
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: Colors.purple[500],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.1),
                                                  offset: Offset(0, 10),
                                                  blurRadius: 12)
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Kanavat",
                                            style: TextStyle(
                                                fontFamily: 'Nunito',
                                                fontSize: 35,
                                                color: Colors.white),
                                          ),
                                        ))),
                                Padding(
                                  padding: EdgeInsets.only(top: 30),
                                  child: Container(
                                    width: double.infinity,
                                    height: platformHeight - 175,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                      Colors.blue[400],
                                      Colors.purple[900]
                                    ])),
                                    child: ListView.separated(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 3,
                                      itemBuilder: (context, index) {
                                        var channel1 = channels[2 * index];
                                        var channel2 = channels[2 * index + 1];
                                        return Container(
                                            height: 200,
                                            child: Row(
                                              children: <Widget>[
                                                ChannelCard(
                                                    id: channel1.id,
                                                    imgURL: channel1.image,
                                                    name: channel1.name),
                                                ChannelCard(
                                                    id: channel2.id,
                                                    imgURL: channel2.image,
                                                    name: channel2.name)
                                              ],
                                            ));
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Container(
                          child: (new Scaffold(
                              body: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Colors.blue[400],
                                  Colors.purple[900]
                                ])),
                              ),
                              endDrawer: Drawer(
                                  child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Colors.grey[900],
                                  Colors.grey[800]
                                ])),
                                child: ListView(
                                  padding: EdgeInsets.only(top: 60),
                                  children: <Widget>[
                                    ListTile(
                                      title: Text(
                                        'Käyttöehdot',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'Nunito',
                                            color: Colors.white),
                                      ),
                                      onTap: () {
                                        // Update the state of the app.
                                        // ...
                                      },
                                    ),
                                    ListTile(
                                      title: Text(
                                        'Kirjaudu ulos',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontFamily: 'Nunito',
                                            color: Colors.white),
                                      ),
                                      onTap: () {
                                        // Update the state of the app.
                                        // ...
                                      },
                                    ),
                                  ],
                                ),
                              )),
                              drawerEdgeDragWidth: 0,
                              floatingActionButton: Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    100, 150, 10, 600),
                                child: new Builder(builder: (context) {
                                  return new FloatingActionButton(
                                    mini: false,
                                    foregroundColor: Colors.white,
                                    backgroundColor: Colors.blue[400],
                                    onPressed: () {
                                      Scaffold.of(context).openEndDrawer();
                                    },
                                    child: new Icon(Icons.settings),
                                  );
                                }),
                              )))),
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
                backgroundColor: Colors.blue[800]),
          )),
    );
  }
}
