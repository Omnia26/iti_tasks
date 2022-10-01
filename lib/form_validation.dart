// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, prefer_typing_uninitialized_variables, avoid_print, curly_braces_in_flow_control_structures, unused_import, deprecated_member_use, unnecessary_string_interpolations, sized_box_for_whitespace, unrelated_type_equality_checks, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class formValidation extends StatefulWidget {
  const formValidation({Key? key}) : super(key: key);

  @override
  State<formValidation> createState() => _formValidationState();
}

class _formValidationState extends State<formValidation> {
  //var value;
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  late String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formkey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: emailcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                maxLength: 30,
                
                decoration: InputDecoration(
                  labelText: "Enter Your Email",
                ),
                validator: (value) {
                  if (value == null) return null;
                  if (!value.contains("@") || !value.contains(".")) {
                    return 'Invalid Email';
                  }
                  return null;
                },
                onChanged: (String value) {
                  print(value);
                },
                onFieldSubmitted: (String value) {
                  print(value);
                },
              ),
              TextFormField(
                controller: passcontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.visiblePassword,
                maxLength: 10,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Enter Your Password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password can not be empty';
                  } else
                    return null;
                },
                onChanged: (String value) {
                  print(value);
                },
                onFieldSubmitted: (String value) {
                  print(value);
                },
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Choose your gender:",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text("Male"),
                leading: Radio(
                  toggleable: true,
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              RadioListTile(
                toggleable: true,
                title: Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),*/
              DropdownButtonFormField(
                //hint:Text("gender",),
                //value: 0,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
                items: const [
                  DropdownMenuItem(
                    child: Text("Gender"),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("Male"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("female"),
                    value: 2,
                  ),
                ],              
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState?.validate() == true) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("welcome"),
                        content: Container(
                          height: 80.0,
                          child: Column(
                            children: [
                              Text(emailcontroller.text),
                              Text(passcontroller.text),
                              Text("${gender}" ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            icon: Text("Ok"),
                  
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text(
                  "Submit",
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
