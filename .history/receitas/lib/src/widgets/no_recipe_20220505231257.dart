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
            Icons.mood_bad,
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
