import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Card Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Card Example'),
        ),
        body: Center(
          child: Card(
            elevation: 10, // adds a shadow effect
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // adds rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Welcome to Flutter Cards!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                      height: 10), // adds spacing between the text and image
                  Image.asset(
                    'assets/logo.png', // adds an image
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                      height: 10), // adds spacing between the image and button
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Click Me!'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
