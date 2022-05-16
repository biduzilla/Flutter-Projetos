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
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Deseja mesmo apagar "${recipe.name}"?'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("Cancelar"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("Apagar"),
                      onPressed: () {
                        onDelete(recipe);
                        Navigator.pop(context);
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => RecipeDetail(
                  recipe: recipe,
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
                            color: Colors.blue, fontWeight: FontWeight.bold),
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
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}
