class Recipes {
  Recipes({
    required this.name,
    required this.description,
    required this.ingredients,
    // required this.image,
  });

  String name;
  String description;
  List<dynamic> ingredients;
  // String image;

  Recipes.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        ingredients = json['ingredients'];
  // image = json['image'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'ingredients': ingredients,
      // 'image': image,
    };
  }
}
