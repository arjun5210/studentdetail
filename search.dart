import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:sqflite/sqflite.dart';

class search extends StatelessWidget {
  search({super.key});

  final searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Center(
              child: TextFormField(
                controller: searchcontroller,
                decoration: const InputDecoration(
                  hintText: "search",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(onPressed: (() {}), child: Text("search")),
            ),
            Expanded(
              child: Container(
                child: FutureBuilder(
                    future: fetchData(),
                    builder: ((context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          List<dynamic> dataList = snapshot.data!;
                          return ListView.builder(
                              itemCount: dataList.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                  title: Text(dataList[1]),
                                );
                              }));
                        } else {
                          return Text("error");
                        }
                      }
                      return Text("sorryyy");
                    })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
