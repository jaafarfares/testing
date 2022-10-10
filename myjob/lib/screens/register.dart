import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/second.dart';
import 'package:myjob/screens/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  final _auth = FirebaseAuth.instance;

  late String _email; // = TextEditingController();
  late String _password; //= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('the register page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            // TextFormField(
            //   controller: _name,
            // decoration: InputDecoration(
            //   labelText: 'username', border: OutlineInputBorder())),
            SizedBox(height: 10),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  _email = value;
                },
                //controller: _email,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder())),
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
              //controller: _password,
              decoration: InputDecoration(
                  labelText: 'password', border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  try {
                    final new_user = await _auth.createUserWithEmailAndPassword(
                        email: _email, password: _password);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => second()));
                  } catch (e) {
                    print(e);
                    throw (e);
                  }
                  //print(_name);
                  //print(_email);
                  //print(_password);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => homepage()),
                  // );
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.blue),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
                    );
                  },
                  child: Text(
                    'Sign up',
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
