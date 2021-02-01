import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginPage.dart';
import 'signupPage.dart';
import 'findPassword.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyTodoList());
}
class MyTodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '할 일',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/sign_up': (context) => SignupPage(),
        '/find_password': (context) => FindPasswordPage(),
        '/home' : (context) => HomePage(),
      },
    );
  }
}