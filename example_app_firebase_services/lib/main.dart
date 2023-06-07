import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './services/auth_service.dart';
// import './services/post_service.dart';
// import './services/notification_service.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // final AuthService _authService = AuthService();
  // final PostService _postService = PostService();
  // final NotificationService _notificationService = NotificationService();

  // await _notificationService.initialize();
  // _notificationService.handleNotifications();

  runApp(MaterialApp(
    title: 'Firebase Auth Sample',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(authService: AuthService()),
  ));
}
