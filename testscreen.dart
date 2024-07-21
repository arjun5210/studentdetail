import 'dart:convert';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/pp.dart';
import 'package:secondproject/gridview.dart';
import 'package:secondproject/searchhope.dart';
import 'package:secondproject/listview.dart';
import 'package:secondproject/splash.dart';
import 'package:secondproject/upadate.dart';
import 'package:secondproject/userdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/models/tabels.dart';

class man extends StatefulWidget {
  man({super.key});

  @override
  State<man> createState() => _manState();
}

class _manState extends State<man> {
  final namecontolller = TextEditingController();

  final agecontoller = TextEditingController();
  final classcontroller = TextEditingController();
  final addresscontroller = TextEditingController();

  var pkp;
  var imagegone;
  File? sip;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    getdata();
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() async {
        await displayalert();
      })),
      appBar: AppBar(
        title: Center(
          child: Text("ADD STUDENT DETAILS"),
        ),
        leading: IconButton(
            onPressed: (() {
              Navigator.of(context).push(MaterialPageRoute(builder: ((context) {
                return finalhope();
              })));
            }),
            icon: Icon(Icons.search)),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                controller: namecontolller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "eror";
                  }
                },
                decoration: const InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: agecontoller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                decoration: const InputDecoration(
                  hintText: "age",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: classcontroller,
                decoration: InputDecoration(
                  hintText: "class",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: addresscontroller,
                decoration: InputDecoration(
                  hintText: "address",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (() {
                  if (formkey.currentState!.validate()) {
                    press();
                  } else {}
                }),
                child: Text("click")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return newtman();
                      })));
                    }),
                    child: Text("View full details in List")),
                TextButton(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return grid();
                      })));
                    }),
                    child: Text("View full details in Grid")),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  getpicture() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    print('${img?.path}');
    setState(() {
      sip = File(img!.path);
    });
  }

  String imageToBase64(File sip) {
    List<int> imageBytes = sip.readAsBytesSync();
    String base64Image = base64UrlEncode(imageBytes);

    print(base64Image);

    return base64Image;
  }

  Future press() async {
    // get image
    //  await getpicture();
    // convert image to string
    // imageToBase64(sip!);

    // convert all into student type

    final data = student(
      name: namecontolller.text,
      age: agecontoller.text,
      classname: classcontroller.text,
      address: addresscontroller.text,
    );

    // give into add data

    await adddata(data);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Details saved")));
  }

  Future displayalert() async {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: Text("Are you Sure want to quit"),
            actions: [
              ElevatedButton(
                  onPressed: (() async {
                    final shared = await SharedPreferences.getInstance();
                    shared.clear();
                    userlistnot.value.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: ((context) {
                      return splashscreen();
                    })), (route) => false);
                  }),
                  child: Text("yes")),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  child: Text("NO")),
            ],
          );
        }));
  }
}
