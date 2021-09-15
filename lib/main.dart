import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';
import 'package:invoice_maker/hive_test.dart';
import 'package:invoice_maker/test_data.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TestDataAdapter());
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;
  late Box<List<TestData>> _box;
  @override
  void initState() {
    super.initState();
    //Hive.openBox(name)

    _init();
  }

  void _init() async {
    // var path = Directory.current.path;
    // Hive..init(path);
    // ..registerAdapter(PersonAdapter());
    //  box = await Hive.openBox("test");
    _box = await Hive.openBox<List<TestData>>('myBox');
    List<TestData> obj = [
      TestData(name: "name", id: 1),
      TestData(name: "name", id: 2),
      TestData(name: "name", id: 3)
    ];
    _box.put("test", obj);
  }

  @override
  Widget build(BuildContext context) {
    List<String> getData = ["", "", ""];
    //   var path = Directory.current.path;
    // Hive
    //   ..init(path)
    //   ..registerAdapter(PersonAdapter());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          // This method is rerun every time setState is called, for instance as done
          // by the _incrementCounter method above.
          //
          // The Flutter framework has been optimized to make rerunning build methods
          // fast, so that you can just rebuild anything that needs updating rather
          // than having to individually change instances of widgets.
          Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("app"),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(getData[0]),
              Text(getData[1]),
              Text(getData[2]),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(nextScreen());
            //getData = _box.get("test")!;
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
