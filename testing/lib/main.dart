import 'package:flutter/material.dart';
import 'package:testing/ui/views/screen_1/screen_1_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffff8c00)),
        useMaterial3: true,
      ),
      home: const Screen1View(),
    );
  }
}
