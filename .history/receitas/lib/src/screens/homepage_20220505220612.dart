import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Text(
              "Minhas Receitas",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            backgroundColor: Colors.purple,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 40,
                ),
                onPressed: () {
                  // do something
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
