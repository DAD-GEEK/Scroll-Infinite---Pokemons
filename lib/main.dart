import 'package:flutter/material.dart';
import 'package:scroll_infinite/views/ListPokemons.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListPokemons(),
      ),
    );
  }
}
