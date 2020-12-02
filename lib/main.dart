import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyClass(),
    );
  }
}

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  List _data;
  Future<String> loadJasonData() async {
    var jsonText = await rootBundle.loadString('assets/user.json');
    setState(() {
      _data = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    this.loadJasonData();

    // TODO: implement initState
    super.initState();
    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14,
            ),
            Image(
              image: AssetImage("images/2.png"),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.16),
              child: Image(
                image: AssetImage("images/1.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
