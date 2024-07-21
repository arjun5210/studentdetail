import 'package:flutter/material.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/fulldetails.dart';
import 'package:secondproject/gridview.dart';
import 'package:secondproject/login.dart';
import 'package:secondproject/register.dart';
import 'package:secondproject/slide.dart';
import 'package:secondproject/splash.dart';
import 'package:secondproject/testscreen.dart';

List<Map<String, Object?>> green = [];
const savekey = "userloggedin";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await databaseinitialize();
  runApp(const MyApp());
}

bool doubt = false;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashscreen(),
    );
  }
}
