import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/recipes.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/recipe_detail.dart';

class RecipeListTile extends StatelessWidget {
  RecipeListTile({
    Key? key,
    required this.recipe,
    required this.onDelete,
  }) : super(key: key);

  final Function(Recipes) onDelete;
  final Recipes recipe;
  List<String> listIngredient = <String>[];

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionExtentRatio: 0.25,
      actionPane: const SlidableStrechActionPane(),
      secondaryActions: [
        IconSlideAction(
          caption: "Deletar",
          color: Colors.blueGrey,
          icon: Icons.delete,
          onTap: () {
            showDialog(
              builder: (context) => AlertDialog(
                  title: Text("Atenção!"),
                  content: Text('Deseja mesmo apagar "${recipe.name}"?'),
                  actions: [
                    TextButton(
                      child: Text("Apagar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                        onDelete(recipe);
                      },
                    ),
                    TextButton(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ]),
              context: context,
            );
          },
        ),
      ],
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RecipeDetail(
                    recipe: recipe,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(recipe.image),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: TextStyle(
                            color: Colors.purple, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        recipe.description,
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
