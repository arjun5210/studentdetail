import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/searchhope.dart';
import 'package:secondproject/splash.dart';
import 'package:secondproject/upadate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/models/tabels.dart';

class userdata extends StatelessWidget {
  userdata({super.key});

  @override
  Widget build(BuildContext context) {
    getdata();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("USER DETAILS DETAILS"),
            ),
            leading: ElevatedButton(
                onPressed: (() {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return finalhope();
                  })));
                }),
                child: Text("search")),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Container(
                  color: Colors.red,
                  width: 500,
                  height: 800,
                  child: ValueListenableBuilder(
                    valueListenable: userlistnot,
                    builder: ((Context, List<user> okk, Widget) {
                      return ListView.separated(
                          itemBuilder: ((context, index) {
                            final data = okk[index];
                            return ListTile(
                              title: Text(data.username),
                              subtitle: Text(data.id.toString()),
                              leading: IconButton(
                                  onPressed: (() async {
                                    await deleteuser(data.username);
                                    final shared =
                                        await SharedPreferences.getInstance();
                                    shared.clear();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(builder: ((context) {
                                      return splashscreen();
                                    })), (route) => false);
                                  }),
                                  icon: Icon(Icons.logout)),
                              trailing: IconButton(
                                  onPressed: (() async {}),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            );
                          }),
                          separatorBuilder: ((context, index) {
                            return Divider();
                          }),
                          itemCount: okk.length);
                    }),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
