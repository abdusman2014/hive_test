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
  late Box<List<TestData>> _box;
  @override
  void initState() {
    super.initState();

    _init();
  }

  void _init() async {
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

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:
          
          Scaffold(
        appBar: AppBar(
     
          title: Text("app"),
        ),
        body: Center(
    
          child: Column(
           
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
            Get.to(NextScreen());
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ), 
      ),
    );
  }
}
