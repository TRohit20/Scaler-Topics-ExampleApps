import 'package:flutter/material.dart';

import './toggle_pages/multiple_optional.dart';
import './toggle_pages/multiple_required.dart';
import './toggle_pages/single_optional.dart';
import './toggle_pages/single_required.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toggle Button App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SingleRequiredTogglePage(),
                  ),
                );
              },
              child: const Text('Single and Required Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SingleNotRequiredTogglePage(),
                  ),
                );
              },
              child: const Text('Single and Not Required Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MultipleRequiredTogglePage(),
                  ),
                );
              },
              child: const Text('Multiple Selections (Required)'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MultipleNotRequiredTogglePage(),
                  ),
                );
              },
              child: const Text('Multiple Selections (Not Required)'),
            ),
          ],
        ),
      ),
    );
  }
}
