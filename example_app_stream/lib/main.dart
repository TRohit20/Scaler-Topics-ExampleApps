import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RandomNumberScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomNumberScreen extends StatefulWidget {
  const RandomNumberScreen({super.key});

  @override
  _RandomNumberScreenState createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  late StreamController<double> _streamController;
  late Stream<double> _numberStream;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<double>();
    _numberStream = _streamController.stream;
    _startEmittingNumbers();
  }

  @override
  void dispose() {
    _streamController.close();
    _timer.cancel();
    super.dispose();
  }

  void _startEmittingNumbers() {
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (_) {
      final random = Random();
      final randomNumber = random.nextDouble();
      _streamController.add(randomNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Stream'),
      ),
      body: Center(
        child: StreamBuilder<double>(
          stream: _numberStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Random Number: ${snapshot.data?.toStringAsFixed(4)}',
                style: TextStyle(fontSize: 24),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
