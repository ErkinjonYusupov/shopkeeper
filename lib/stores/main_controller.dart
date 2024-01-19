import 'package:shopkeeper/config/imports.dart';
import 'package:shopkeeper/pages/categories.dart';
import 'package:shopkeeper/pages/input_output.dart';
import 'package:shopkeeper/pages/products.dart';

class MainController extends GetxController {
  int currentPage = 1;

  List<MenuModel> menus = menuModelFromJson([
    {"id": 1, "title": "Bosh sahifa", "icon": AppIcons.home},
    {"id": 2, "title": "Kategoriyalar", "icon": AppIcons.category},
    {"id": 3, "title": "Mahsulotlar", "icon": AppIcons.products},
    {"id": 4, "title": "Kirim-chiqim", "icon": AppIcons.inputOutput},
  ]);

  bool isCurrenPage(int id) {
    return id == currentPage;
  }

  void setPage(int id) {
    currentPage = id;
    update();
  }

  Widget choosePage() {
    switch (currentPage) {
      case 1:
        return const HomePage();
      case 2:
        return const CategoriesPage();
      case 3:
        return const ProductsPage();
      case 4:
        return const InputOutputPage();
    }
    return Container();
  }
}
