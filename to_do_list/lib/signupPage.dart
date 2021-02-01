import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();


  Future<void> addUser(String id, String password) {
    return users.add({
      'id': id,
      'pw': password
    }).then((value) => print("User Added")).catchError((error) => print('Failed to add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 250.0, 20.0, 150.0),
          child: Center(
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'ID',
                      border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.text,
                    controller: idController,
                  ),
                  SizedBox(
                    height: 20.0
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder()
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: pwController,
                  ),
                  SizedBox(
                      height: 20.0
                    ),
                    FlatButton(
                      color: Colors.purple,
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      onPressed: () {// 조건을 더 넣어서 다듬어야 함
                        addUser(idController.text, pwController.text);
                      },
                    ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
