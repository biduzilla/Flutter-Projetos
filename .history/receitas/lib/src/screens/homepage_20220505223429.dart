import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  String? errorText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Minhas Receitas",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: ListView(children: [
          TextField(
            controller: nomeController,
            decoration: InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(color: Colors.green),
              errorText: errorText,
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
          ),
        ]),
      ),
    );
  }
}
