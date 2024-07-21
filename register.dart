import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';
import 'package:secondproject/login.dart';

class reg extends StatelessWidget {
  reg({super.key});

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  hintText: "username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  if (formkey.currentState!.validate()) {
                    add(context);
                  }
                }),
                child: Text("reg"))
          ],
        ),
      ),
    ));
  }

  Future add(context) async {
    final gh = user(
        username: usernamecontroller.text, password: passwordcontroller.text);

    await adduser(gh);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: ((context) {
      return log();
    })));
  }
}
