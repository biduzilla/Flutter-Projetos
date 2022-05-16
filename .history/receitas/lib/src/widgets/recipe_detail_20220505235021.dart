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
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
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
                        child: Image.network(
                          recipe.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        recipe.description,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Ingredientes",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0;
                              i < recipe.ingredients.length;
                              i++) ...[
                            Text(recipe.ingredients[i],
                                style: TextStyle(fontWeight: FontWeight.w300)),
                            SizedBox(height: 10),
                          ],
                        ],
                      ),
                      SizedBox(height: 40),
                      Center(
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.blue,
                          child: Text(
                            "Voltar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
