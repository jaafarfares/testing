import 'package:flutter/material.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/second.dart';
import 'package:myjob/screens/user.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the user page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(labelText: 'username')),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(labelText: 'Job title')),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 10),
            TextFormField(
                decoration: InputDecoration(labelText: 'Employee / employer')),
            SizedBox(height: 10),
            TextFormField(
                decoration: InputDecoration(labelText: 'phone number')),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(labelText: 'github')),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(labelText: 'Linkden')),
            SizedBox(height: 40),
            TextFormField(
                decoration: InputDecoration(labelText: 'Description')),
            ElevatedButton(onPressed: () {}, child: const Text('submit')),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
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
    );
  }
}
