import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjob/screens/login.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/usersettings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _auth = FirebaseAuth.instance;

  late String _email; // = TextEditingController();
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[290],
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'the register page',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w800, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              //TextFormField(
              //   controller: _name,
              //  decoration: InputDecoration(
              //    labelText: 'username', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
              ),
              // SizedBox(height: 10),
              // TextFormField(
              //     controller: _title,
              //     decoration: InputDecoration(
              //         labelText: 'Employee / employer',
              //         border: OutlineInputBorder())),
              // SizedBox(height: 10),
              // TextFormField(
              //     controller: _phone,
              //     keyboardType: TextInputType.number,
              //     inputFormatters: <TextInputFormatter>[
              //       FilteringTextInputFormatter.digitsOnly
              //     ],
              //     decoration: InputDecoration(
              //         labelText: 'phone number', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                onChanged: (value) {
                  _password = value;
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18, horizontal: 30),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.purple, width: 2))),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      final new_user =
                          await _auth.createUserWithEmailAndPassword(
                              email: _email, password: _password);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => loginpage()));
                    } catch (e) {
                      print(e);
                      showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                alignment: Alignment.center,
                                backgroundColor: Colors.grey[200],
                                title: Text(
                                  textAlign: TextAlign.center,
                                  "Try again !!!!",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                elevation: 40.0,
                              )));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    //shape: const CircleBorder(),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    'Save and Sign up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              SizedBox(height: 300),
              //Container(
              //padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              //decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(12),
              //color: Colors.blue),
              //child: Center(
              //child: TextButton(
              //onPressed: () {
              //Navigator.push(
              //context,
              //MaterialPageRoute(builder: (context) => homepage()),
              //);
              //},
              //child: Text(
              //'Sign up',
              //style: TextStyle(
              //color: Colors.white,
              //fontWeight: FontWeight.bold,
              //fontSize: 20,
              //),
              //),
              //),
              //),
              //),
            ],
          ),
        ),
      ),
    );
  }
}
