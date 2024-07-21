import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/fulldetails.dart';
import 'package:secondproject/searchhope.dart';
import 'package:secondproject/upadate.dart';

import 'db/models/tabels.dart';

class newtman extends StatefulWidget {
  newtman({super.key});

  @override
  State<newtman> createState() => _newtmanState();
}

class _newtmanState extends State<newtman> {
  @override
  Widget build(BuildContext context) {
    getdata();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("VIEW STUDENT DETAILS"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentlistnot,
                  builder: ((Context, List<student> std, Widget) {
                    return ListView.separated(
                        itemBuilder: ((context, index) {
                          final data = std[index];
                          return ListTile(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: ((context) {
                                return our(
                                  studentid: data.id,
                                  studentname: data.name,
                                  studentage: data.age,
                                  studentclass: data.classname,
                                  studentaaddress: data.address,
                                );
                              })));
                            },
                            title: Text(data.name),
                            subtitle: Text(data.id.toString()),
                            leading: IconButton(
                                onPressed: (() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: ((context) {
                                    return updatedetails(idid: data.id);
                                  })));
                                }),
                                icon: Icon(Icons.update)),
                            trailing: IconButton(
                                onPressed: (() async {
                                  await deletedata(data.name);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("deleted")));
                                }),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                )),
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return Divider();
                        }),
                        itemCount: std.length);
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
