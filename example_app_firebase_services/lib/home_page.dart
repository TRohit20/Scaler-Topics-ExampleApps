import 'package:example_app_firebase_services/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final AuthService authService;

  HomePage({required this.authService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Auth Sample')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: () {
                // Implement sign-in functionality
                authService.signInWithEmailAndPassword('email', 'password');
              },
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: () {
                // Implement sign-out functionality
                authService.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
