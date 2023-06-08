import 'package:flutter/material.dart';

class MultipleNotRequiredTogglePage extends StatefulWidget {
  const MultipleNotRequiredTogglePage({super.key});

  @override
  _MultipleNotRequiredTogglePageState createState() =>
      _MultipleNotRequiredTogglePageState();
}

class _MultipleNotRequiredTogglePageState
    extends State<MultipleNotRequiredTogglePage> {
  final List<bool> _isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Selections (Not Required)'),
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
                Icon(Icons.check_box),
                Icon(Icons.check_box_outline_blank),
                Icon(Icons.check_circle),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Selected Buttons: ${_isSelected.where((selected) => selected).length}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
