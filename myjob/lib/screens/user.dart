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
      body: Column(
        children: [
          SizedBox(height: 400.0),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.grey),
            child: Center(
              child: TextButton(
                onPressed: () {
                  // if (_formkey.currentState!.validate()) {
                  // var result = FirebaseAuth.instance
                  //   .signInWithEmailAndPassword(
                  //     email: _emailcontroller.text,
                  //   password: _passwordcontroller.text);

                  //if (result != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                  //} else {
                  //print('user not found');
                  //}
                  //   }
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
    );
  }
}
