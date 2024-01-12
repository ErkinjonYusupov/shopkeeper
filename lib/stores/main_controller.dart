import 'package:shopkeeper/config/imports.dart';

class MainController extends GetxController {
  List<MenuModel> menus = menuModelFromJson([
    {"id": 1, "title": "Bosh sahifa", "icon": AppIcons.home},
    {"id": 2, "title": "Kategoriyalar", "icon": AppIcons.category},
    {"id": 3, "title": "Mahsulotlar", "icon": AppIcons.products},
    {"id": 4, "title": "Kirim-chiqim", "icon": AppIcons.inputOutput},
  ]);
}
