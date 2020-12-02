import 'package:Bacancy_task10/listtiledetails.dart';
import 'package:flutter/material.dart';

class MyListTile extends StatefulWidget {
  String imageUrl, className, coachName, classType, classTiming, totalUser;
  List data, userData;
  MyListTile(this.imageUrl, this.className, this.coachName, this.classType,
      this.classTiming, this.totalUser, this.data, this.userData);

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyViewItemDetails(
                  widget.imageUrl,
                  widget.className,
                  widget.coachName,
                  widget.classType,
                  widget.classTiming,
                  widget.totalUser,
                  widget.data,
                  widget.userData),
            ));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[400]),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.009,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.imageUrl),
                radius: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.className,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(widget.classType, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.005,
                  ),
                  Row(
                    children: [
                      Text(
                        "Coach:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.008,
                      ),
                      Text(widget.coachName, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Time:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.008,
                      ),
                      Text(widget.classTiming, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.totalUser,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.008,
                      ),
                      Text("People", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
