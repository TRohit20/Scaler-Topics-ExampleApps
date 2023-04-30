import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IconButton Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IconButton Example'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  print('Add button pressed');
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Tooltip(
                message: 'Delete',
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    print('Delete button pressed');
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Badge(
                  label: const Text('5'),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications))),
              const SizedBox(
                width: 20,
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  icon: const Icon(Icons.favorite),
                  color: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
