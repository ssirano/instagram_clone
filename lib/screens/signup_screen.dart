import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/screens/main_screen.dart';
import 'main_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
          ElevatedButton(
            child: Text('Sign up'),
            onPressed: () async {
              try {
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()),
                );
          }catch (e){
                print(e);
              }
          })
        ],
      )
    );
  }
}
