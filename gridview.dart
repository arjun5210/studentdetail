import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';

class grid extends StatelessWidget {
  grid({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ValueListenableBuilder(
                valueListenable: studentlistnot,
                builder: ((BuildContext, List<student> std, Widget) {
                  return GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: List.generate(
                        std.length,
                        (index) => Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(std[index].name),
                                      Text(std[index].age),
                                    ]),
                              ),
                            )),
                  );
                }))));
  }
}
