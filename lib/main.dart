import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() => runApp(MyApp());

final MqttClient client = MqttClient('test.mosquitto.org', '');

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');

  int currentTab = 0;

  PageOne one;
  PageTwo two;
  List<Widget> pages;
  Widget currentPage;

  List<Data> dataList;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,
      dataList: dataList,
    );
    two = PageTwo(
      key: keyTwo,
    );

    pages = [one, two];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestr"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Device Management',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
            ),
            ListTile(
              title: Text('Glove 1',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              onTap: () {
                //_prefix = "http://192.168.1.182:8080/";
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  final List<Data> dataList;
  PageOne({
    Key key,
    this.dataList,
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState();
}

class PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        Text(
                          'Current Gesture',
                          style: Theme
                              .of(context)
                              .textTheme
                              .display1,
                        ),

                        Text(
                          'Will state current gesture here',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]
                  )
                ]
            )
        )
    );
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({Key key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sensor Values',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1,
                ),
              ]
            )
        )
    );*/
    return new Container(
        padding: new EdgeInsets.only(
            left: 50.0, right: 20.0, top: 100.0, bottom: 80.0),
        child: new Column(
            children: <Widget>[
              new Expanded(
                flex: 1,
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      gaugetop()
                    ]
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      gaugemiddle()
                    ]
                ),
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      gaugebottom()
                    ]
                ),
              ),
            ]
        )
    );
  }

  Widget gaugetop() {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.orangeAccent,
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.redAccent,
          ),
        ]
    );
  }

  Widget gaugemiddle() {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.orangeAccent,
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.redAccent,
          ),
        ]
    );
  }

  Widget gaugebottom() {
    return new Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.orangeAccent,
          ),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
          ),
          new CircularPercentIndicator(
            radius: 150.0,
            lineWidth: 20.0,
            percent: (0 + 0.5),
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 300,
            center: new Text('Power: ${(1) * 10 }'),
            progressColor: Colors.redAccent,
          ),
        ]
    );
  }

}






class Data {
  final int id;
  bool expanded;
  final String title;
  Data(this.id, this.expanded, this.title);
}