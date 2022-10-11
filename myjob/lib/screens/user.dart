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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'user profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'username', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Job title', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Employee / employer',
                      border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'phone number', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'github', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Linkden', border: OutlineInputBorder())),
              SizedBox(height: 10),
              TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Description', border: OutlineInputBorder())),
              ElevatedButton(
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
                      fontSize: 20,
                    ),
                  )),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey),
                  child: TextButton(
                    onPressed: () {
                      _auth.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginpage()),
                      );
                    },
                    child: Text(
                      'loug out',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
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
