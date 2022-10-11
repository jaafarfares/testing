import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjob/screens/user.dart';
import 'login.dart';

class second extends StatefulWidget {
  const second({super.key});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  final _auth = FirebaseAuth.instance;
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
        print(signedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the login page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 300.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.deepPurple),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => user()),
                    );
                  },
                  child: Text(
                    'go to user account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
