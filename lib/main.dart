import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(calcApp());
}

class calcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                customOutlineButton("9"),
                customOutlineButton("8"),
                customOutlineButton("7"),
                customOutlineButton("+")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("6"),
                customOutlineButton("5"),
                customOutlineButton("4"),
                customOutlineButton("-")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("3"),
                customOutlineButton("2"),
                customOutlineButton("1"),
                customOutlineButton("X")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlineButton("c"),
                customOutlineButton("0"),
                customOutlineButton("="),
                customOutlineButton("/")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlineButton(String val) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(25.0),
        onPressed: () => btnClicked(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }

  int first, second;
  String res, text = "", opp;
  btnClicked(String val) {
    if (val == "c") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (val == "+" || val == "-" || val == "X" || val == "/") {
      first = int.parse(text);
      res = "";
      opp = val;
    } else if (val == "=") {
      second = int.parse(text);
      print("Second ${second}");
      if (opp == "+") {
        res = (first + second).toString();
      } else if (opp == "-") {
        res = (first - second).toString();
      } else if (opp == "X") {
        res = (first * second).toString();
      } else if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + val).toString();
    }
    setState(() {
      text = res;
    });
  }
}
