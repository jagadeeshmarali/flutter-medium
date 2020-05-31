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
    timings = timingsMapList.map((x) => ListModel.fromJson(x)).toList();
    print(timings[0].timings);

    super.initState();
  }

  getraisedbuttons({int start, int end}) {
    List<Widget> timebuttons = List<Widget>();
    for (int i = start; i < end; i += 3) {
      if (i + 2 == end) {
        timebuttons.add(_rowButtons(
            button1: _button(time: timings[0].timings[i]),
            button2: _button(time: timings[0].timings[i + 1])));
      } else if (i + 1 == end) {
        timebuttons
            .add(_rowButtons(button1: _button(time: timings[0].timings[i])));
      } else if (i + 2 < end) {
        timebuttons.add(_rowButtons(
            button1: _button(time: timings[0].timings[i]),
            button2: _button(time: timings[0].timings[i + 1]),
            button3: _button(time: timings[0].timings[i + 2])));
      }
    }

    return Column(
      children: timebuttons,
    );
  }

  Widget _rowButtons({Widget button1, Widget button2, Widget button3}) {
    return Row(
      children: <Widget>[
        button1,
        if (button2 != null) button2,
        if (button3 != null) button3
      ],
    );
  }

  Widget _button({String time}) {
    return Container(
      // height: 50,
      // width: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(10),
      child: RaisedButton(
        elevation: 10,
        onPressed: () {
          print(time);
        },
        child: Text(time),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grid View"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '5:00 to 7:00 : ',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Expanded(
                    child: getraisedbuttons(start: 0, end: 9),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    '7:00 to 9:00 : ',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  Expanded(
                    child: getraisedbuttons(start: 9, end: 11),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
