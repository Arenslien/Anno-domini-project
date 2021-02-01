import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 250.0, 20.0, 150.0),
            child: Center(
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: idController,
                      decoration: InputDecoration(
                        labelText: 'ID',
                        border: OutlineInputBorder(

                        )
                      ),
                      keyboardType:  TextInputType.text
                    ),
                    SizedBox(
                      height: 20.0
                    ),
                    TextFormField(
                      controller: pwController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder()
                      ),
                      keyboardType:  TextInputType.text,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 20.0
                    ),
                    FlatButton(
                      color: Colors.purple,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      minWidth: double.infinity,
                      onPressed: () {
                        //firebase 에서 데이터 read한 후 검정해본 후 home으로 이동
                        // if() {
                        //   Navigator.pushNamed(context, '/home');
                        // }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextButton(
                            child: Text('Forgot password?'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/find_password');
                            },
                          ),
                          TextButton(
                            child: Text('Create account'),
                            onPressed: () {
                              Navigator.pushNamed(context, '/sign_up');
                            },
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
