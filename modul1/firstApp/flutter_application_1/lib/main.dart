import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello Wordl Ini adlaah text pertama saya!', 
          textAlign: TextAlign.center,
          style: TextStyle(
            backgroundColor: Colors.brown,
            color: Color.fromARGB(255, 0, 239, 128),
            fontSize: 20,
          ),
          ),
        ),
      ),
    );
  }
}