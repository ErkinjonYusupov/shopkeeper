class MenuModel {
  int id;
  String title;
  String icon;
  MenuModel({
    required this.id,
    required this.title,
    required this.icon,
  });
  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(id: json['id'], title: json['title'], icon: json['icon']);
  }
}

List<MenuModel> menuModelFromJson(List list) {
  return List<MenuModel>.from(list.map((item) => MenuModel.fromJson(item)));
}
