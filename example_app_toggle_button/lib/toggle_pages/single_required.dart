import 'package:flutter/material.dart';

class SingleRequiredTogglePage extends StatefulWidget {
  const SingleRequiredTogglePage({super.key});

  @override
  _SingleRequiredTogglePageState createState() =>
      _SingleRequiredTogglePageState();
}

class _SingleRequiredTogglePageState extends State<SingleRequiredTogglePage> {
  bool _isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single and Required Toggle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  _isToggled = index == 0;
                });
              },
              isSelected: [_isToggled, !_isToggled],
              children: const [
                Icon(Icons.check),
                Icon(Icons.close),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              _isToggled ? 'Toggle is ON' : 'Toggle is OFF',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
