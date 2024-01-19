import 'package:shopkeeper/config/database.dart';
import 'package:shopkeeper/config/imports.dart';

class CategoriesController extends GetxController {
  MyDb myDb = MyDb();
  bool loading = false;
  TextEditingController title = TextEditingController();

  Future<void> create() async {
    if(loading)return;
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
    } catch (err) {
      print(err);
    }finally{
      loading = false;
    }
  }
  List categories = [];
  
  Future<void> fetch() async {
    try {
      await myDb.open();
      var res =  await myDb.db!.rawQuery('select * from categories');
      categories = res.toList();
    } catch (err) {
      print(err);
    }
  }
}
