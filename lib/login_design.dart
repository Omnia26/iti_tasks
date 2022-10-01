// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers, curly_braces_in_flow_control_structures, must_be_immutable
import 'package:flutter/material.dart';

class loginDesign extends StatelessWidget {
  loginDesign({Key? key}) : super(key: key);

  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,
                //end: Alignment.,
                colors: [
              Color.fromRGBO(202, 81, 229, 1),
              Color.fromRGBO(192, 61, 214, 1),
              Color.fromRGBO(162, 41, 188, 1),
              Color.fromRGBO(132, 21, 148, 1),
            ])),
        child: Form(
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Icon(
                  Icons.account_circle,
                  size: 100.0,
                ),*/
                Image(
                  image: AssetImage(
                    'assets/images/outline_account_circle_white_24dp.png',
                  ),
                  //height: 100.0,
                  //width: 100.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      //enabled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(
                          30.0,
                        ),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email can not be empty';
                      } else
                        return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    //enabled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  obscureText: true, //**
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty';
                      } else
                        return null;
                    },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (formkey.currentState?.validate()== true) {///
                        print(emailcontroller.value);
                        print(passcontroller.value);

                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.pink[900],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Can not access your account?',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
