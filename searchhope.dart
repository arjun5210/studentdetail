import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:secondproject/db/functions/fun.dart';
import 'package:secondproject/db/models/tabels.dart';
import 'package:secondproject/listview.dart';
import 'package:secondproject/upadate.dart';

class finalhope extends StatefulWidget {
  finalhope({super.key});

  @override
  State<finalhope> createState() => _finalhopeState();
}

class _finalhopeState extends State<finalhope> {
  final searchcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    pillerlistnot.value.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("SEARCH"),
        ),
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "error";
                  }
                },
                controller: searchcontroller,
                decoration: const InputDecoration(
                  hintText: "enter username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: (() async {
                  if (formkey.currentState!.validate()) {
                    searchitem(searchcontroller.text, context);
                  }
                }),
                child: Text("search")),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: pillerlistnot,
                  builder: (Context, List<student> jki, Widget) {
                    return ListView.separated(
                        itemBuilder: ((context, index) {
                          final data = jki[index];
                          return Container(
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    "STUDENT DETAILS",
                                    style: TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: Container(
                                    width: 300,
                                    height: 400,
                                    child: Card(
                                      shadowColor: Colors.black,
                                      elevation: 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("id"),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(data.id.toString()),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Name"),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(data.name),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Age"),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(data.age.toString()),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("class"),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(data.classname),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Address"),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                Text(data.address),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                TextButton(
                                                    onPressed: (() {
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) {
                                                        return updatedetails(
                                                            idid: data.id);
                                                      })));
                                                    }),
                                                    child: Text("Update")),
                                                SizedBox(
                                                  width: 100,
                                                ),
                                                TextButton(
                                                    onPressed: (() async {
                                                      await deletedata(
                                                          data.name);
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) {
                                                        return newtman();
                                                      })));

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(SnackBar(
                                                              content: Text(
                                                                  "deleted")));
                                                    }),
                                                    child: Text("Delete")),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return Divider();
                        }),
                        itemCount: jki.length);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
