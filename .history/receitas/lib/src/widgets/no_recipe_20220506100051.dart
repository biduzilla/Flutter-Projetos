import 'package:flutter/material.dart';

class NoRecipes extends StatelessWidget {
  const NoRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Icon(
            Icons.sentiment_dissatisfied,
            color: Colors.purple,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Sem Receitas para Ver",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
