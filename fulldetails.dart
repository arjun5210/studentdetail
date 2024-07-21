import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';
import 'package:secondproject/listview.dart';
import 'package:secondproject/upadate.dart';

class our extends StatefulWidget {
  var studentid;
  var studentname;
  var studentage;
  var studentclass;
  var studentaaddress;

  our({
    required this.studentid,
    required this.studentname,
    required this.studentage,
    required this.studentclass,
    required this.studentaaddress,
  });

  @override
  State<our> createState() => _ourState();
}

class _ourState extends State<our> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("STUDENT DETAILS"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "STUDENT DETAILS",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 300,
              height: 400,
              child: Card(
                shadowColor: Colors.black,
                elevation: 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("id"),
                          SizedBox(
                            width: 100,
                          ),
                          Text(widget.studentid.toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Name"),
                          SizedBox(
                            width: 100,
                          ),
                          Text(widget.studentname),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Age"),
                          SizedBox(
                            width: 100,
                          ),
                          Text(widget.studentage.toString()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("class"),
                          SizedBox(
                            width: 100,
                          ),
                          Text(widget.studentclass),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Address"),
                          SizedBox(
                            width: 100,
                          ),
                          Text(widget.studentaaddress),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: (() {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: ((context) {
                                  return updatedetails(idid: widget.studentid);
                                })));
                              }),
                              child: Text("Update")),
                          SizedBox(
                            width: 100,
                          ),
                          TextButton(
                              onPressed: (() async {
                                await deletedata(widget.studentname);
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: ((context) {
                                  return newtman();
                                })));

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("deleted")));
                              }),
                              child: Text("Delete")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
