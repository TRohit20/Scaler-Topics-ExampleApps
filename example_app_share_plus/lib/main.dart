import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const ShareDemoApp());
}

class ShareDemoApp extends StatelessWidget {
  const ShareDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Share Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShareDemoScreen(),
    );
  }
}

class ShareDemoScreen extends StatelessWidget {
  const ShareDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _shareText('Hello, check out this amazing article!');
              },
              child: const Text('Share Text'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _shareImage('path/to/image.jpg');
              },
              child: const Text('Share Image'),
            ),
          ],
        ),
      ),
    );
  }

  void _shareText(String text) {
    Share.share(text);
  }

  void _shareImage(String imagePath) {
    Share.shareFiles([imagePath]);
  }
}
