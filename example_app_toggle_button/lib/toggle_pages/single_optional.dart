import 'package:flutter/material.dart';

class SingleNotRequiredTogglePage extends StatefulWidget {
  const SingleNotRequiredTogglePage({super.key});

  @override
  _SingleNotRequiredTogglePageState createState() =>
      _SingleNotRequiredTogglePageState();
}

class _SingleNotRequiredTogglePageState
    extends State<SingleNotRequiredTogglePage> {
  final List<bool> _isSelected = [false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single and Not Required Toggle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  _isSelected[index] = !_isSelected[index];
                });
              },
              isSelected: _isSelected,
              children: const [
                Icon(Icons.star_border),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _isSelected[0] ? 'Toggle is ON' : 'Toggle is OFF',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
