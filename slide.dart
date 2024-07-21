import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class slide extends StatelessWidget {
  const slide({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          color: Colors.blue,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 400,
          color: Colors.yellow,
        )
      ],
    )));
  }
}

class slideone extends StatelessWidget {
  const slideone({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shadowColor: Colors.black,
          elevation: 15,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          color: Color.fromARGB(255, 33, 32, 32),
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: IconButton(
                    style: IconButton.styleFrom(),
                    onPressed: (() {}),
                    icon: const Icon(Icons.play_arrow_rounded),
                    color: Colors.green,
                    iconSize: 60,
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(right: 12, top: 15, bottom: 10),
                    child: Text(
                      "MalaiKottaiy Valiban",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  subtitle: Text(
                    "Rakk Rakk (shyam pushkar)",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 35, bottom: 10, top: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: (() {}),
                          child: Text(
                            "play",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 35, bottom: 10, top: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: (() {}),
                          child: Text(
                            "pause",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const Text("no change in screenn"),
        Card(
          shadowColor: Colors.black,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/man.jpg"))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Container(
                  width: 250,
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Text("iam")),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 80,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 20,
                          blurRadius: 20,
                          offset: Offset(5, 5),
                        ),
                      ],
                      color: Colors.red,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/anjam.jpg"),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Colors.yellow,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .1,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                            color: Color.fromARGB(121, 0, 0, 0),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(5, 5))
                      ]),
                )
              ],
            )),
      ],
    )));
  }
}
