// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myjob/screens/register.dart';
import 'package:myjob/screens/home.dart';
import 'package:myjob/screens/user.dart';
import 'package:myjob/screens/usersettings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:passwordfield/passwordfield.dart';

class loginpage extends StatefulWidget {
  loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _auth = FirebaseAuth.instance;
  late String _email;
  late String _password;

  @override
  void dispose() {
    super.dispose();
  }

  // Toggles the password show status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[290],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: unnecessary_new
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Colors.grey[400],
                  ),
                  onPressed: () {},
                  child: const Icon(
                    Icons.handshake_outlined,
                    size: 80,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'MyJob',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Row(children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  const Text(
                    'define your future!',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: 'Courier'),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: const Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),
                const SizedBox(height: 110.0),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        top: 15,
                        bottom: 15,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: TextField(
                          
                          maxLength: 24,

                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            _email = value;
                          },
                          //controller: _emailcontroller,
                          decoration: InputDecoration(
                              counterText: '',
                              border: InputBorder.none,
                              hintText: 'Email'),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 10,
                        ),
                        child: ListTile(
                          leading: Icon(Icons.lock_person),
                          title: PasswordField(
                            errorMaxLines: null,
                            maxLength: 20,
                            onChanged: (value) {
                              _password = value;
                            },

                            border: null,
                            onSubmit: null,
                            inputDecoration: null,
                            hasFloatingPlaceholder: false,
                            passwordConstraint: r'[a-zA-Z0-9]{6}',
                            // color: Colors.grey,
                            //passwordConstraint: r'.*[@$#.*].*',
                            //inputDecoration: PasswordDecoration(),
                            //hintText: 'Password',
                            //border: PasswordBorder(
                            //border: OutlineInputBorder(
                            //borderSide: BorderSide(
                            //:color: Colors.blue.shade100,
                            //),
                            //borderRadius: BorderRadius.circular(12),
                            //),
                            // focusedBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            // color: Colors.blue.shade100,
                            // ),
                            // borderRadius: BorderRadius.circular(12),
                            //),
                            // focusedErrorBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(12),
                            //borderSide: BorderSide(
                            //  width: 2, color: Colors.red.shade200),
                            //),
                            // ),
                            errorMessage:
                                'Password must be longer then 6 charachters',
                          ),
                        ),
                      ),
                    )),
                /* Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)), */
/*                     child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: ListTile(
                        leading: Icon(Icons.lock_person),
                        title: TextField(
                          maxLength: 15,

                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                          },
                          //controller: _passwordcontroller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ), */
                const SizedBox(height: 15.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.deepPurple),
                    child: Center(
                      child: TextButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          try {
                            final user = await _auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home()));

                            AlertDialog alert = AlertDialog(
                              alignment: Alignment.center,
                              contentTextStyle: TextStyle(),
                              title: Text(
                                "Sucsess!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber),
                              ),
                              //content: Text("successfully loged in",
                              //  textAlign: TextAlign.center),
                            );

                            // show the dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return alert;
                              },
                            );
                          } catch (e) {
                            Alert(
                                    context: context,
                                    title: "failed login",
                                    desc: "Incorrect Email Or Password.")
                                .show();
                            print(e);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      ' Not A Member?',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => register()),
                        );
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        ' Register Now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
