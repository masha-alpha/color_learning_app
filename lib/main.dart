import 'package:flutter/material.dart';
import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colors Quiz',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
