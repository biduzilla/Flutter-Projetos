import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../models/recipes.dart';

class RecipeDetail extends StatelessWidget {
  final Recipes recipe;
  RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Text(recipe.name,
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(Icons.restaurant, size: 150)
                  // child: Image.network(
                  //   recipe.image,
                  //   fit: BoxFit.fitWidth,
                  // ),
                  ),
              SizedBox(height: 20),
              Text(
                recipe.description,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Ingredientes",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < recipe.ingredients.length; i++) ...[
                    Text("- " + recipe.ingredients[i],
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 15)),
                    SizedBox(height: 10),
                  ],
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  height: 50,
                  width: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      "Voltar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          )
        ]),
      ),
    );
  }
}
