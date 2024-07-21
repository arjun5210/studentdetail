import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/login.dart';
import 'package:secondproject/main.dart';
import 'package:secondproject/testscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  late List<Map<String, Object?>> checkdata;
  @override
  void initState() {
    checkcheck();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("splash"),
      ),
    );
  }

  Future checkcheck() async {
    final check = await SharedPreferences.getInstance();

    final jk = check.getBool(savekey);
    if (jk == true) {
      // ignore: use_build_context_synchronously
      await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return man();
      })));
    } else {
      // ignore: use_build_context_synchronously
      await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: ((context) {
        return log();
      })));
    }
  }

  void fire() async {
    final c = doubt == true;
    print(c);
  }
}
