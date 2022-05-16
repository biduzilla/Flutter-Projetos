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
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(
                  labelText: "Nome",
                  errorText: errorText,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descricaoController,
                decoration: InputDecoration(
                  labelText: "Descrição",
                  errorText: errorText,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: imageController,
                decoration: InputDecoration(
                  labelText: "URL da Imagem",
                  errorText: errorText,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              ElevatedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
