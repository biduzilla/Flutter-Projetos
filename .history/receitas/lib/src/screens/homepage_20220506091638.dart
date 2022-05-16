import 'package:flutter/material.dart';
import '../models/recipes.dart';
import '../repository/recipe_repository.dart';
import '../widgets/no_recipe.dart';
import '../widgets/recipe_list.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();

  final RecipeRepository recipeRepository = RecipeRepository();
  List<Recipes> recipes = [];
  Recipes? deletedRecipe;
  int? deletedRecipePos;
  final fields = [];
  List<String> ingredients = [];
  void initState() {
    super.initState();

    recipeRepository.getRecipeList().then((value) {
      setState(() {
        recipes = value;
      });
    });
  }

  void _addFields() {
    setState(() {
      fields.add('');
    });
  }

  void _removeField(int index) {
    setState(() {
      fields.removeAt(index);
    });
  }

  void onDelete(Recipes recipe) {
    deletedRecipe = recipe;
    deletedRecipePos = recipes.indexOf(recipe);
    setState(() {
      recipes.remove(recipe);
    });
    recipeRepository.saveRecipeList(recipes);

    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Receita ${recipe.name} foi removida com sucesso!",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        action: SnackBarAction(
          label: "Desfazer",
          textColor: Colors.yellow,
          onPressed: () {
            setState(() {
              recipes.insert(deletedRecipePos!, deletedRecipe!);
            });
            recipeRepository.saveRecipeList(recipes);
          },
        ),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  Recipes recipeTeste = Recipes(
    name: 'miojo',
    description: 'miojo de frango',
    ingredients: ['miojo', 'agua'],
  );
  // image:
  //     'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Mama_instant_noodle_block.jpg/300px-Mama_instant_noodle_block.jpg');

  String? errorText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
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
                  onChanged: (text) {
                    ingredients.clear();
                  },
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
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    _addFields();
                  },
                  child: Text("+ Adicionar Ingredientes",
                      style: TextStyle(color: Colors.purple, fontSize: 15)),
                ),
                for (var i = 0; i < fields.length; i++)
                  Row(children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          ingredients.add(text);
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.remove_circle, color: Colors.purple),
                      onPressed: () {
                        if (!ingredients.isEmpty) {
                          ingredients.removeAt(i);
                        }
                        _removeField(i);
                      },
                    ),
                  ]),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        String nome = nomeController.text;
                        String descricao = descricaoController.text;
                        // String image = imageController.text;

                        if (nome.isEmpty || descricao.isEmpty) {
                          setState(() {
                            errorText = "Campo não pode estar vazio";
                          });
                          return;
                        }
                        FocusScope.of(context).requestFocus(FocusNode());
                        nomeController.clear();
                        descricaoController.clear();
                        // imageController.clear();
                        setState(() {
                          errorText = null;
                        });
                        Recipes newRecipe = Recipes(
                            description: descricao,
                            // image: image,
                            ingredients: ingredients,
                            name: nome);

                        recipes.add(newRecipe);
                        recipeRepository.saveRecipeList(recipes);
                        fields.clear();
                      },
                      child: Text("Salvar Receita!",
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
                if (recipes.isEmpty) NoRecipes(),
                Column(
                  children: [
                    for (Recipes recipe in recipes)
                      RecipeListTile(
                        recipe: recipe, onDelete: onDelete,
                        // ingredients: [
                        //   recipe.ingredients.split('-'),
                        // ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
