import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secondproject/db/models/tabels.dart';

import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages

ValueNotifier<List<student>> studentlistnot = ValueNotifier([]);
ValueNotifier<List<user>> userlistnot = ValueNotifier([]);
ValueNotifier<List<student>> pillerlistnot = ValueNotifier([]);

late Database db;

List df = [];
List gh = [];
var jki;
Future<dynamic> you = Future.value(jki);
Future<dynamic> arun = Future.value(gh);
Future<void> databaseinitialize() async {
  db = await openDatabase('student.db', version: 5,
      onCreate: (Database db, int version) async {
    await db.execute(
        'CREATE TABLE studenttabel (id INTEGER PRIMARY KEY,name TEXT,age TEXT)');

    await db.execute(
        'CREATE TABLE user (id INTEGER PRIMARY KEY,username TEXT,password TEXT)');
  }, onUpgrade: (db, oldVersion, newVersion) async {
    if (oldVersion < 5) {
      await db.execute('ALTER TABLE studenttabel ADD COLUMN classname  TEXT');
      await db.execute('ALTER TABLE studenttabel ADD COLUMN address  TEXT');
    }
  }

      // onUpgrade: (db, oldVersion, newVersion) async {
      // if (oldVersion < 2) {
      // await db.execute('ALTER TABLE studenttabel ADD COLUMN pictures TEXT');
      // }
      // },

      //  onUpgrade: (db, oldVersion, newVersion) async{
      //     if (oldVersion < 2) {
      //    await db.execute('ALTER TABLE my_table ADD COLUMN new_column TEXT');
      //  }

      //  },
      );
}

Future adddata(student value) async {
  await db.rawInsert(
    'INSERT INTO studenttabel (name,age,classname,address) VALUES(?,?,?,?)',
    [
      value.name,
      value.age,
      value.classname,
      value.address,
    ],
  );
  print("image add");
  studentlistnot.value.add(value);

  studentlistnot.notifyListeners();

  getdata();
}

Future getdata() async {
  studentlistnot.value.clear();
  final h = await db.rawQuery('SELECT * FROM studenttabel');
  studentlistnot.value.clear();
  h.forEach(
    (map) {
      final std = student.mapof(map);
      studentlistnot.value.add(std);
      studentlistnot.notifyListeners();
    },
  );
  print(h);
}

// delete
Future deletedata(id) async {
  await db.rawDelete('DELETE FROM studenttabel WHERE name = ?', [id]);
  studentlistnot.value.remove(id);

  studentlistnot.notifyListeners();
  getdata();
//
}

Future updatedata(
    int id, String name, String age, String classname, String address) async {
  db.update(
    'studenttabel',
    {
      'name': name,
      'age': age,
      'classname': classname,
      'address': address,
    },
    where: 'id = ?',
    whereArgs: [id],
  );
  getdata();
}

Future searchitem(String name, context) async {
  final ser = await db.rawQuery(
    'SELECT * FROM studenttabel WHERE name = ?',
    [name],
  );
  if (ser.isEmpty) {
    print("not found");

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(" username not found")));
  }
  ser.forEach(
    (map) {
      final jki = student.mapof(map);
      pillerlistnot.value.add(jki);
      pillerlistnot.notifyListeners();
    },
  );

  print(ser);

//  List df = ser;
//  return ser;
}

Future<List<dynamic>> fetchData() async {
  return gh;
}

// adduser

// check user

// log out

Future adduser(user value) async {
  await db.rawInsert('INSERT INTO user (username,password) VALUES(?,?)',
      [value.username, value.password]);

  userlistnot.value.add(value);
  userlistnot.notifyListeners;

  print("usersaved");
}

Future checkuser(String name, password) async {
  var ch = await db.rawQuery(
      'SELECT name,password FROM user WHERE name=? & password=? ',
      [name, password]);
  if (ch != null) {}
}

Future displayuser() async {
  final ss = await db.rawQuery('SELECT * FROM user');
  userlistnot.value.clear();
  ss.forEach(
    (map) {
      final okk = user.mapof(map);
      userlistnot.value.add(okk);
      userlistnot.notifyListeners();
    },
  );
}

Future deleteuser(String username) async {
  db.rawDelete('DELETE FROM user WHERE username =?', [username]);

  userlistnot.value.clear();
  userlistnot.notifyListeners();
}
