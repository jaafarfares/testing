// ignore_for_file: prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjob/screens/login.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/user.dart';
import 'package:myjob/screens/usersettings.dart';
import 'package:shadow/shadow.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/material/checkbox.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class usersettins extends StatefulWidget {
  const usersettins({super.key});

  @override
  State<usersettins> createState() => _usersettings();
}

class _usersettings extends State<usersettins> {
  final _firestore = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  late String? _username;
  late String? _profession;
  late String? _email;
  String? _title;
  late int? _number;
  late String? _github;
  late String? _linkden;
  late String? _description;

  bool value = false;
  bool valuee = false;
  //late String employer;

  late User signedInUser;

  @override
  void initState() {
    super.initState();
    getcurrentuser();
  }

  void getcurrentuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        //signedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Welcome {$users._username}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              size: 35,
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => user()),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 10,
                                color: Color.fromARGB(255, 130, 100, 180),
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 95,
                          backgroundColor: Colors.yellow,
                          backgroundImage: AssetImage("images/home_img.png"),
                        ),
                      ),
                      Positioned(
                        bottom: 5.0,
                        right: 5.0,
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(children: [
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          this.value = !value;
                          if (value != null) {
                            _title == 'Employee';
                            print(_title);
                          } else {
                            _title == null;
                            print(_title);
                          }
                          value == _title;
                        });
                        value == _title;
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      title: Text(
                        "Employee",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Checkbox(
                        //tristate: true,

                        value: value,
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      /*                     decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Employer',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2))), */
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ListTile(
                      onTap: () {
                        setState(() {
                          this.valuee = !valuee;
                          this.value = value;
                          if (value != null) {
                            _title == 'Employer';
                            print(_title);
                          } else {
                            _title == null;
                          }
                          value == _title;
                        });
                        value == _title;
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      title: Text(
                        "Employer",
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Checkbox(
                        tristate: true,
                        value: valuee,
                        onChanged: (valuee) {
                          setState(() {
                            this.valuee = valuee!;
                          });
                        },
                      ),
                    ),
                  ),
                ]),
                SizedBox(height: 10),
                TextFormField(
                  onChanged: (value) {
                    _username = value;
                  },
                  style: TextStyle(fontSize: 20),
                  /*                   validator: (value) {
                      if (value == null || value.length < 3) {
                        return 'Please enter some text';
                      }
                      return null;
                    }, */
                  maxLength: 15,
                  decoration: InputDecoration(
                    counterText: '',
                    //errorText: '',
                    hintText: 'Jaafar',
                    labelText: 'username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.purple, width: 2)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _profession = value.toString();
                    },
                    style: TextStyle(fontSize: 20),
                    maxLength: 22,
                    decoration: InputDecoration(
                        // floatingLabelBehavior: FloatingLabelBehavior.always,
                        counterText: '',
                        hintText: 'Software Eengineer',
                        labelText: 'Profession',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _email = value.toString();
                    },
                    style: TextStyle(fontSize: 20),
                    maxLength: 25,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: 'jaafar@gmail.com',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),

                /*               ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    title: Row(
                      children: <Widget>[
                        Expanded(child: Text('employee')),
                        Checkbox(tristate: true, value: null, onChanged: null),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                counterText: '',
                                //labelText: 'Employee',
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide(
                                        color: Colors.purple, width: 2))),
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: new Icon(Icons.chevron_right),
                      color: Colors.black26,
                      onPressed: () {},
                    )), */
                SizedBox(height: 10),
                /*               TextFormField(
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        counterText: '',
                        labelText: 'Employee / employer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))), */
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _number = int.parse(value);
                    },
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    maxLength: 8,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: '123456789',
                        labelText: 'phone number',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _github = value.toString();
                    },
                    style: TextStyle(fontSize: 20),
                    maxLength: 15,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: 'jaafarfares',
                        labelText: 'github',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _linkden = value.toString();
                    },
                    style: TextStyle(fontSize: 20),
                    maxLength: 15,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: 'fares jaafar',
                        labelText: 'Linkden',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),
                SizedBox(height: 10),
                TextFormField(
                    onChanged: (value) {
                      _description = value.toString();
                    },
                    style: TextStyle(fontSize: 20),
                    maxLength: 300,
                    maxLines: 4,
                    decoration: InputDecoration(
                        counterText: '',
                        alignLabelWithHint: true,
                        hintText: 'tell me more details about yourself.',
                        labelText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.purple, width: 2)))),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        //shape: const CircleBorder(),
                        backgroundColor: Colors.deepPurple,
                      ),
                      onPressed: () {
                        _firestore.collection('users').add({
                          'user name': _username,
                          'number': _number,
                          'linkden': _linkden,
                          'description': _description,
                          'githuub': _github,
                          'email': _email,
                          'title': _title,
                          'profession': _profession,
                        });
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      )),
                ),
                SizedBox(height: 70),
                /*             Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: TextButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginpage()),
                        );
                      },
                      child: InkWell(
                        child: Icon(
                          size: 45,
                          Icons.logout,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
