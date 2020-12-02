import 'dart:convert';

import 'package:Bacancy_task10/listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyViewItem extends StatefulWidget {
  List userData;
  MyViewItem(this.userData);
  @override
  _MyViewItemState createState() => _MyViewItemState();
}

class _MyViewItemState extends State<MyViewItem> {
  List _data;

  Future<String> loadJasonData() async {
    var jsonText = await rootBundle.loadString('assets/class.json');
    setState(() {
      _data = json.decode(jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.loadJasonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image(
                  image: NetworkImage(
                      "https://d2779tscntxxsw.cloudfront.net/593c06b120102.jpeg?width=1200&quality=80")),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04,
                      left: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.04,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Available Classes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.6,
              margin: EdgeInsets.only(
                // top: MediaQuery.of(context).size.height * 0.04,
                left: MediaQuery.of(context).size.width * 0.07,
                right: MediaQuery.of(context).size.width * 0.05,
              ),
              child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return MyListTile(
                        _data[index]['classImage'],
                        _data[index]['className'],
                        _data[index]['coachName'],
                        _data[index]['classType'],
                        _data[index]['classTiming'],
                        _data[index]['signInUserId'] != null
                            ? _data[index]['signInUserId'].length.toString()
                            : "0",
                        _data[index]['signInUserId'],
                        widget.userData);
                  })),
        ],
      ),
    );
  }
}
