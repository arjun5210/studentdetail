import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';

class updatedetails extends StatelessWidget {
  updatedetails({required this.idid});

  final idid;
  final name = TextEditingController();
  final age = TextEditingController();
  final classname = TextEditingController();
  final address = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("UPDATE STUDENT DETAILS"),
            ),
            body: Form(
              key: formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "invalid";
                        }
                      },
                      controller: name,
                      decoration: const InputDecoration(
                        hintText: "name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "invalid";
                        }
                      },
                      controller: age,
                      decoration: const InputDecoration(
                        hintText: "age",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "invalid";
                        }
                      },
                      controller: classname,
                      decoration: const InputDecoration(
                        hintText: "class",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "invalid";
                        }
                      },
                      controller: address,
                      decoration: const InputDecoration(
                        hintText: "address",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: (() {
                        if (formkey.currentState!.validate()) {
                          modified(context);
                        }
                      }),
                      child: Text("update")),
                ],
              ),
            )));
  }

  Future modified(BuildContext context) async {
    // here image not modified
    await student(
        name: name.text,
        age: age.text,
        id: idid,
        classname: classname,
        address: address);
    await updatedata(idid, name.text, age.text, classname.text, address.text);
    await ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("data Updated")));
    Navigator.of(context).pop();
  }
}
