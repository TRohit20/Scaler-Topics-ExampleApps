import 'package:flutter/material.dart';

void main() {
  runApp(const GestureDetectorDemoApp());
}

class GestureDetectorDemoApp extends StatelessWidget {
  const GestureDetectorDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDetector Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GestureDetectorDemoPage(),
    );
  }
}

class GestureDetectorDemoPage extends StatefulWidget {
  const GestureDetectorDemoPage({super.key});

  @override
  _GestureDetectorDemoPageState createState() =>
      _GestureDetectorDemoPageState();
}

class _GestureDetectorDemoPageState extends State<GestureDetectorDemoPage> {
  String _gestureStatus = 'Try Gestures!';

  void _handleTap() {
    setState(() {
      _gestureStatus = 'Tap gesture detected';
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _gestureStatus = 'Double tap gesture detected';
    });
  }

  void _handleLongPress() {
    setState(() {
      _gestureStatus = 'Long press gesture detected';
    });
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    setState(() {
      _gestureStatus =
          'Pan gesture update: dx=${details.delta.dx.toStringAsFixed(2)}, dy=${details.delta.dy.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GestureDetector Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _handleTap,
              onDoubleTap: _handleDoubleTap,
              onLongPress: _handleLongPress,
              onPanUpdate: _handlePanUpdate,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    _gestureStatus,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
