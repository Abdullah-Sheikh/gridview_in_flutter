import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class Area{
  int index;
  String name;
  Color color;
  Area(
  {
    this.index = -1, this.name = "Area", this.color: Colors.lightBlueAccent
}
      );
}

class _State extends State<MyApp> {

  int _Location;
  List<Area> _areas;

  @override
  void initState() {
    _areas = new List<Area>();
    for(int i=0; i<16; i++)
      {
        _areas.add(new Area(index: i,name: 'Area ${i}'));
      }
    var rng=new Random();
    _Location = rng.nextInt(_areas.length);

  }

  Widget _generate(int index)
  {
    return new GridTile(child: new Container(
      padding: new EdgeInsets.all(5.0),
      child: new RaisedButton(onPressed: () => _onClicked(index),
        color: _areas[index].color,
      child: new Text(_areas[index].name,textAlign: TextAlign.center,),),



    ));
  }

  void _onClicked(int index)
  {
 setState(() {
   if (index == _Location)
     {
       _areas[index].color = Colors.green;
     }
   else
     {
       _areas[index].color = Colors.red;
     }
 });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Treasure in Box'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new GridView.count(crossAxisCount: 4,
          children: new List<Widget>.generate(16, _generate),),
        ),
      ),
    );
  }
}