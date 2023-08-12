import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        secondaryHeaderColor: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Choreography Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(_createRoute());
          },
          child: Container(
            width: 200,
            height: 200,
            color: Theme.of(context).primaryColor,
            child: const Center(
              child: Text(
                'Tap Me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DetailsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var offsetTween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(offsetTween);

        var rotationTween = Tween(begin: 0.0, end: 1.0);
        var rotationAnimation = animation.drive(rotationTween);

        return SlideTransition(
          position: offsetAnimation,
          child: RotationTransition(
            turns: rotationAnimation,
            child: child,
          ),
        );
      },
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Theme.of(context).secondaryHeaderColor,
          child: const Center(
            child: Text(
              'Details',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
