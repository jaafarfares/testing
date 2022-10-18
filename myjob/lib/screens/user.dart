// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjob/screens/usersettings.dart';
import 'login.dart';
import 'package:readmore/readmore.dart';

class user extends StatefulWidget {
  const user({super.key});

  @override
  State<user> createState() => _usersettings();
}

class _usersettings extends State<user> {
  String content =
      'Engineering techniques are used to inform[clarification needed] the software development process[1][4] which involves the definition, implementation, assessment, measurement, management, change, and improvement of the software life cycle process itself. It heavily uses software configuration management[1][4] which is about systematically controlling changes to the configuration, and maintaining the integrity and traceability of the configuration and code throughout the system life cycle. Modern processes use software versioning';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 60,
        iconTheme: IconThemeData(
          size: 32,
          color: Colors.black, //change your color here
        ),
        //leading: Icon(
        //Icons.arrow_back,
        //color: Colors.black,
        //size: 33,
        //),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              size: 35,
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              //_auth.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => usersettins()),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          maxRadius: 70,
                          backgroundImage: AssetImage('images/myimg.png'),
                        ),
                        Positioned(right: 18, child: Icon(Icons.verified_user))
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Jaafar Fares',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              fontFamily: 'ComingSoon'),
                        ),
                        Text(
                          'Employer',
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 27,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        Icon(Icons.work, color: Colors.deepPurple),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Software Engenier',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: Colors.deepPurple),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Builder(builder: (context) {
                  return ReadMoreText(
                    content,
                    trimLines: 3,
                    textAlign: TextAlign.justify,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: " Show More ",
                    trimExpandedText: " Show Less ",
                    lessStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    moreStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      height: 2,
                    ),
                  );
                }),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.deepPurple, width: 3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 8,
                          right: 8,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  'Number',
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SelectableText(
                                  '58777000',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 23),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.deepPurple, width: 3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.grey[600],
                                ),
                                Text(
                                  'Email',
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              //decoration: BoxDecoration(
                              //color: Colors.grey[200],
                              //borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  SelectableText(
                                    'jaafarfares@gmail.com',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.deepPurple, width: 3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Image(
                                  image: AssetImage('images/git.png'),
                                  width: 50,
                                  height: 50,
                                )
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                SelectableText(
                                  'jaafarfares',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 23),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Colors.deepPurple, width: 3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 10,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Row(
                          children: <Widget>[
                            Column(
                              children: [
                                Image(
                                  image: AssetImage('images/link.png'),
                                  width: 50,
                                  height: 50,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              //decoration: BoxDecoration(
                              //color: Colors.grey[200],
                              //borderRadius: BorderRadius.circular(12)),
                              child: Column(
                                children: [
                                  SelectableText(
                                    'fares jaafar',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
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
