import 'dart:io';

import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Профиль',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Профиль'),
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
  int activeIndex;
  var _bottomNavIndex = 2;
  List<IconData> _iconTypes = [
    Icons.home,
    Icons.person,
  ];

  /// Handler for when you want to programmatically change
  /// the active index. Calling `setState()` here causes
  /// Flutter to re-render the tree, which `AnimatedBottomNavigationBar`
  /// responds to by running its normal animation.
  void _onTap(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Color(0xff47536d),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => exit(0))
        ],
      ),
      body: new Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            elevation: 10,
            // Change this
            shadowColor: Colors.black,
            // Change this
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Container(
                  alignment: Alignment.center,
                  padding: new EdgeInsets.only(
                      top: 15.0, bottom: 15, left: 10, right: 10),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Text(
                          "Имя",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Курьер",
                              fillColor: Color(0xffeff2f7),
                              suffixIcon: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Изменить",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                    fontSize: 16,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  padding:
                                      EdgeInsets.only(right: 20), // Set padding
                                ),
                              )),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 12),
                        child: Text(
                          "Телефон",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            hintText: "+77775553344",
                            fillColor: Color(0xffeff2f7),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('История добавления товара'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff47536d),
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
            )
          ])
        ],
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
              child: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              onPressed: () {}),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: _iconTypes,
        // backgroundColor: Color(0xff47536d),
        activeIndex: _bottomNavIndex,
        activeColor: Colors.blue,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
