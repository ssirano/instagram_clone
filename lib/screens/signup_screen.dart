import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/screens/main_screen.dart';
import 'package:instagram_clone/screens/signin_screen.dart';
import 'main_screen.dart';

class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instagram Clone Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 16),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text('Sign up'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
                } catch (e){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
            SizedBox(height: 16),
            TextButton(
              child: Text('Already have an account? Sign In'),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
