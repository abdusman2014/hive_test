import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:invoice_maker/test_data.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
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
        child: Column(
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
