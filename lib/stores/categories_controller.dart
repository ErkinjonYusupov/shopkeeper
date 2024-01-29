import 'package:shopkeeper/config/database.dart';
import 'package:shopkeeper/config/imports.dart';
import 'package:shopkeeper/models/category.dart';

class CategoriesController extends GetxController {
  MyDb myDb = MyDb();
  bool loading = false;

  TextEditingController title = TextEditingController();

  Future<void> create() async {
    if (loading) return;
    if (title.text.trim().isEmpty) {
      Get.snackbar("Diqqat", "Ma'lumot kiriting",
          backgroundColor: Colors.red, colorText: AppColors.white);
      return;
    }
    try {
      loading = true;
      await myDb.open();
      await myDb.db!.rawInsert(
          'insert into categories (title) values (?)', [title.text.trim()]);
      Get.back();
      title.clear();
      Get.snackbar("Bajarildi", "Kategoriya yaratildi",
          backgroundColor: Colors.green, colorText: AppColors.white);
      fetch();
    } catch (err) {
      Get.snackbar("Error", err.toString(),
          backgroundColor: Colors.red, colorText: AppColors.white);
    } finally {
      loading = false;
    }
  }

  List<CategoryModel> categories = [];

  Future<void> fetch() async {
    try {
      loading = true;
      update();
      await myDb.open();
      var res =
          await myDb.db!.rawQuery('select * from categories order by id desc');
      categories = categoriesFromJson(res.toList());
    } catch (err) {
      Get.snackbar("Error", err.toString(),
          backgroundColor: Colors.red, colorText: AppColors.white);
    } finally {
      loading = false;
      update();
    }
  }

  CategoryModel? selected;

  Future<void> edit() async {
    if (loading) return;
    if (title.text.trim().isEmpty) {
      Get.snackbar("Diqqat", "Ma'lumot kiriting",
          backgroundColor: Colors.red, colorText: AppColors.white);
      return;
    }
    try {
      loading = true;
      update();
      await myDb.open();
      await myDb.db!.rawUpdate('update categories set title = ? where id = ?',
          [title.text, selected!.id]);
      Get.back();
      Get.snackbar("Bajarildi", "Kategoriya tahrirlandi",
          backgroundColor: Colors.green, colorText: AppColors.white);
      fetch();
    } catch (err) {
      Get.snackbar("Error", err.toString(),
          backgroundColor: Colors.red, colorText: AppColors.white);
    } finally {
      loading = false;
      update();
    }
  }

  Future<void> editActive() async {
    if (loading) return;

    try {
      var active = selected!.active == 1 ? 0 : 1;
      loading = true;
      update();
      await myDb.open();
      await myDb.db!.rawUpdate('update categories set active = ? where id = ?',
          [active, selected!.id]);
      Get.back();
      Get.snackbar("Bajarildi",
          "Kategoriya ${active == 1 ? 'aktivlashdi' : 'noaktivlashdi'}",
          backgroundColor: Colors.green, colorText: AppColors.white);
      fetch();
    } catch (err) {
      Get.snackbar("Error", err.toString(),
          backgroundColor: Colors.red, colorText: AppColors.white);
    } finally {
      loading = false;
      update();
    }
  }
}
