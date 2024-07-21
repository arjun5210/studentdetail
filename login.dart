import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';
import 'package:secondproject/main.dart';
import 'package:secondproject/register.dart';
import 'package:secondproject/splash.dart';
import 'package:secondproject/testscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class log extends StatefulWidget {
  log({super.key});

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();
  late List<Map<String, Object?>> house;
  var helo = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign In",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
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
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: "password",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: (() async {
                await loginUser(
                    usernamecontroller.text, passwordcontroller.text, context);
              }),
              child: Text("login")),
          TextButton(
              onPressed: (() {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: ((context) {
                  return reg();
                })));
              }),
              child: Text("register"))
        ],
      ),
    ));
  }

  Future checkuser(String name, String password, context) async {
    var ch = await db.rawQuery(
        'SELECT username,password FROM user WHERE username=? AND password=? ',
        [name, password]);
  }

  ///////////////////////// login completed............

  Future<bool> loginUser(String username, String password, context) async {
    var result = await db.rawQuery(
        "SELECT * FROM $user WHERE username = '$username' AND password = '$password'");
    house = result;

    if (result.isNotEmpty) {
      setState(() {
        changevalue(true);
      });
      final nock = await SharedPreferences.getInstance();
      nock.setBool(savekey, true);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return splashscreen();
      })));
    } else {
      print("oooooo");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalis username or password")));
    }
    return result.isNotEmpty;
  }

  void checkcheck() async {
    if (doubt == true) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return man();
      })));
    }
  }

  void changevalue(bool newvalue) {
    setState(() {
      doubt = newvalue;
    });
  }
}
