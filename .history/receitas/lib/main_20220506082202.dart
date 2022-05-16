
import 'package:flutter/material.dart';
import 'package:receitas/src/screens/homepage.dart';
@dart=2.9
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minhas Receitas',
      home: HomePageScreen(),
    );
  }
}
