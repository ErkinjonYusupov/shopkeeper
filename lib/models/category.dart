class CategoryModel {
  int id;
  String title;
  int active;

  CategoryModel({
    required this.active,
    required this.id,
    required this.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        active: json['active'], id: json['id'], title: json['title']);
  }
}




List<CategoryModel> categoriesFromJson(List list) {
  return List<CategoryModel>.from(list.map((item) => CategoryModel.fromJson(item)));
}
