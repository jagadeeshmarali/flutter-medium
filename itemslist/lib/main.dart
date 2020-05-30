import 'package:flutter/material.dart';
import 'package:itemslist/data/list_data.dart';
import 'package:itemslist/model/list_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  List<ListModel> timings;
  @override
  void initState() {
    // TODO: implement initState
    timings =
        timingsMapList.map((x) => ListModel.fromJson(x)).toList();
        print(timings[0].timings);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    );
  }
}
