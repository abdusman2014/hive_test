import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:invoice_maker/test_data.dart';

class nextScreen extends StatefulWidget {
  @override
  _nextScreenState createState() => _nextScreenState();
}

class _nextScreenState extends State<nextScreen> {
  late Box<List<TestData>> _box;
  List<TestData> getData = [];

  @override
  void initState() {
    super.initState();
    _box = Hive.box<List<TestData>>('myBox');
    getData = _box.get("test")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(getData[0].name + ", " + getData[0].id.toString()),
            Text(getData[2].name + ", " + getData[2].id.toString()),
            Text(getData[3].name + ", " + getData[3].id.toString()),
          ],
        ),
      ),
    );
  }
}
