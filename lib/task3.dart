// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unrelated_type_equality_checks, unused_label, avoid_print, unused_local_variable, annotate_overrides, empty_statements, unnecessary_string_interpolations, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:ititask/task3class.dart';

class TaskThree extends StatefulWidget {
  const TaskThree({Key? key}) : super(key: key);
  @override
  State<TaskThree> createState() => _TaskThreeState();
}

class _TaskThreeState extends State<TaskThree> {
  var nameInput = TextEditingController();
  var numInput = TextEditingController();
  var dateInput = TextEditingController();
  var currenttime = DateTime.now()
      .add(Duration(days: 2, hours: 2, seconds: 50, milliseconds: 100));


  @override
  void initState() {
    super.initState();
  }

  List<UserModel> users = [
    UserModel(
      id: 1,
      name: 'omnia Ali',
      workdate: DateTime.now(),
    ),
    UserModel(
      id: 1,
      name: 'Abdullah Mansour',
      workdate: DateTime.now(),
    ),
  ];
  bool isshowed = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                controller: nameInput,
                decoration: InputDecoration(
                  labelText: "Enter title data of ListTile",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: numInput,
                decoration: InputDecoration(
                  labelText: "Enter leading data of ListTile",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
                //maxLength: 10,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: TextFormField(
                controller: dateInput,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.parse('1900-08-28'),
                    lastDate: DateTime.parse('2023-08-28'),
                  );
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("yyyy-MM-dd").format(pickedDate);
                    print(pickedDate);
                    setState(() {
                      dateInput.text = formattedDate;
                      print(formattedDate);
                    });
                  }
                  ;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Choose Date",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
                child: Text("submit"),
                onPressed: () {
                  setState(() {
                    isshowed = !isshowed;
                  });

                }),
                Column(
                  children: [
                    isshowed ? ListView.separated(
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text("${nameInput.text}"),
                        leading: Text("${numInput.text}"),
                        subtitle: Text("${dateInput.text}"),
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: users.length,
                    shrinkWrap: true,
                  )
                    
                    
                    
                    /*Card(
                  child: ListTile(
                    leading: Text("${numInput.text}"),
                    title: Text("${nameInput.text}"),
                    subtitle: Text("${dateInput.text}"),
                    trailing: MaterialButton(
                        child: Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: const Text("Alert Dialog Box"),
                              content: const Text(
                                  "You have raised a Alert Dialog Box"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.green,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("okay"),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                )*/
                : Container(
                  child: Text("",),
                ),
                  ]
                ),
            SizedBox(height: 10.0),
            /*ListView.separated(
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text("${nameInput.text}"),
                  leading: Text("${numInput.text}"),
                  subtitle: Text("${dateInput.text}"),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: users.length,
              shrinkWrap:true,
            ),*/
          ],
        ),
      ),
    );
  }
}
