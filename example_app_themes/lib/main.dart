import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData? _currentTheme;

  @override
  void initState() {
    super.initState();
    _currentTheme = ThemeData.light();
  }

  void _changeTheme(ThemeData theme) {
    setState(() {
      _currentTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _currentTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Theme Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Change the Theme:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Light Mode'),
                    onPressed: () {
                      _changeTheme(ThemeData.light());
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Dark Mode'),
                    onPressed: () {
                      _changeTheme(ThemeData.dark());
                    },
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    child: const Text('Customized Theme'),
                    onPressed: () {
                      _changeTheme(ThemeData(primarySwatch: Colors.red
                          // Customize other properties as needed
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
