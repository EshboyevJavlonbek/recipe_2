class RecipeModel {
  final int id, categoryId, timeRequired;
  final String title, description, photo;
  final num rating;

  RecipeModel({
    required this.id,
    required this.categoryId,
    required this.timeRequired,
    required this.title,
    required this.description,
    required this.photo,
    required this.rating,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      categoryId: json['categoryId'],
      timeRequired: json['timeRequired'],
      title: json['title'],
      description: json['description'],
      photo: json['photo'],
      rating: json['rating'],
    );
  }
}
