import 'package:flutter/material.dart';
import 'package:myjob/screens/login.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/user.dart';
import 'package:shadow/shadow.dart';
import 'package:drop_shadow/drop_shadow.dart';
import 'package:firebase_auth/firebase_auth.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[290],
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'User profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 90,
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage("images/home_img.png"),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.camera_alt,
                          color: Color.fromARGB(255, 234, 245, 243),
                          size: 30,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                  maxLength: 15,
                  decoration: InputDecoration(
                      labelText: 'username',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 15,
                  decoration: InputDecoration(
                      labelText: 'Profession',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 25,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Employee / employer',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 8,
                  decoration: InputDecoration(
                      labelText: 'phone number',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 15,
                  decoration: InputDecoration(
                      labelText: 'github',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 15,
                  decoration: InputDecoration(
                      labelText: 'Linkden',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              SizedBox(height: 10),
              TextFormField(
                  maxLength: 300,
                  maxLines: 5,
                  decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)))),
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //shape: const CircleBorder(),
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {},
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
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 175, 133, 248)),
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
                      Icons.logout,
                      color: Colors.black,
                    )
                        //'loug out',
                        //style: TextStyle(
                        //color: Colors.white,
                        //fontWeight: FontWeight.bold,
                        //fontSize: 15,
                        //),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
