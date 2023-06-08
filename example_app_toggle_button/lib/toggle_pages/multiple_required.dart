import 'package:flutter/material.dart';

class MultipleRequiredTogglePage extends StatefulWidget {
  const MultipleRequiredTogglePage({super.key});

  @override
  _MultipleRequiredTogglePageState createState() =>
      _MultipleRequiredTogglePageState();
}

class _MultipleRequiredTogglePageState
    extends State<MultipleRequiredTogglePage> {
  final List<bool> _isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Selections (Required)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  _isSelected[index] = !_isSelected[index];
                  if (!_isSelected.contains(true)) {
                    // At least one button must be selected
                    _isSelected[index] = true;
                  }
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
