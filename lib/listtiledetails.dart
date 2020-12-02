import 'package:Bacancy_task10/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyViewItemDetails extends StatefulWidget {
  String imageUrl, className, coachName, classType, classTiming, totalUser;
  List data, userData;
  MyViewItemDetails(
      this.imageUrl,
      this.className,
      this.coachName,
      this.classType,
      this.classTiming,
      this.totalUser,
      this.data,
      this.userData);
  @override
  _MyViewItemDetailsState createState() => _MyViewItemDetailsState();
}

class _MyViewItemDetailsState extends State<MyViewItemDetails> {
  List loopData1, searchData1;
  TextEditingController searchText = TextEditingController();
  SharedPreferences logindata;
  void initial() async {
    logindata = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    // TODO: implement initState
    loopData1 = widget.data.toList();
    for (int i = 0; i < 5; i++) {
      if (!loopData1.contains((i + 1).toString())) {
        loopData1.add((i + 1).toString());
      }
    }
    initial();
    searchData1 = widget.userData.toList();
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
              Image(image: NetworkImage(widget.imageUrl)),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        widget.className,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.008),
                          child: Text(widget.classType,
                              style: TextStyle(fontSize: 15))),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Coach:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Text(widget.coachName, style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Time:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.015,
                      ),
                      Text(widget.classTiming, style: TextStyle(fontSize: 15)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: SingleChildScrollView(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Members",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                          ),
                                          Text(widget.totalUser + " People"),
                                        ],
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        margin: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey, width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Icon(Icons.search),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Expanded(
                                              child: TextField(
                                                controller: searchText,
                                                decoration: InputDecoration(
                                                  hintStyle:
                                                      TextStyle(fontSize: 16),
                                                  hintText: 'Search People',
                                                  border: InputBorder.none,
                                                ),
                                                onChanged: (text) {
                                                  setState(() {
                                                    searchData1 = widget
                                                        .userData
                                                        .where((v) => (v[
                                                                "userName"]
                                                            .toLowerCase()
                                                            .contains(text
                                                                .toLowerCase())))
                                                        .toList();
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.55,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.65,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: searchData1.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    widget.imageUrl),
                                              ),
                                              title: Text(searchData1[index]
                                                      ['userName']
                                                  .toString()),
                                              trailing: widget.data.contains(
                                                      searchData1[index]
                                                              ["userId"]
                                                          .toString())
                                                  ? Text(" ")
                                                  : trailing(searchData1[index]
                                                          ["userId"]
                                                      .toString()),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Text(
                          widget.totalUser + " People",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.05),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ),
                    onTap: () {
                      logindata.setBool('login', true);
                      Navigator.pushReplacement(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => MyLoginScreen()));
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget trailing(String id) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.blue[300]),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            "Add",
            style: TextStyle(color: Colors.blue[300]),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          widget.data.add(id);
          widget.totalUser = (int.parse(widget.totalUser) + 1).toString();
          searchText.text = "";
          Navigator.of(context).pop();
        });
      },
    );
  }
}
