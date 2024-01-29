import 'package:shopkeeper/components/default/confirm_dialog.dart';
import 'package:shopkeeper/config/imports.dart';
import 'package:shopkeeper/models/category.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  CategoriesController controller = Get.put(CategoriesController());

  @override
  void initState() {
    controller.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(
      builder: (controller) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Kategoriyalar"),
              centerTitle: false,
              actions: [
                IconButton(
                    onPressed: () {
                      controller.selected = null;
                      controller.title.clear();
                      Get.dialog(
                          barrierDismissible: false,
                          AddCategoryDialog(controller: controller));
                    },
                    icon: const Icon(Icons.add_circle, size: 35))
              ],
            ),
            body: controller.loading
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ))
                : ListView(
                    children:
                        List.generate(controller.categories.length, (index) {
                      return CategoryCard(
                          item: controller.categories[index],
                          controller: controller);
                    }),
                  ));
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.item, required this.controller});
  CategoryModel item;
  CategoriesController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
          Row(
            children: [
              Text(item.title,
                  style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    controller.selected = item;
                    controller.title.text = item.title;
                    Get.dialog(
                        barrierDismissible: false,
                        AddCategoryDialog(controller: controller));
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                    color: AppColors.green5,
                  ))
            ],
          ),
          Row(
            children: [
              Text(
                item.active == 1 ? "Faol" : "Nofaol",
                style: TextStyle(
                    color: item.active == 1 ? AppColors.green5 : Colors.red,
                    fontWeight: FontWeight.w600),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    controller.selected = item;
                    Get.dialog(ConfirmDialog(
                      title: "Diqqat",
                      text:
                          "Siz rostan ${item.title} kategoriyasini ${item.active == 1 ? 'nofaollashtirishni' : 'faollashtirishni'}  tasdiqlamoqchimisiz?",
                      onTap: () {
                        controller.editActive();
                      },
                    ));
                  },
                  icon:
                      Icon(Icons.check_box, size: 20, color: AppColors.green5))
            ],
          ),
        ],
      ),
    );
  }
}

class AddCategoryDialog extends StatelessWidget {
  AddCategoryDialog({super.key, required this.controller});
  CategoriesController controller;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  controller.selected == null
                      ? "Kategoriya qo'shish"
                      : "Kategoriya tahrirlash",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Kategoriya nomi",
                  style: TextStyle(
                      color: AppColors.grey4, fontWeight: FontWeight.w700),
                )),
            TextField(
              controller: controller.title,
              cursorHeight: 20,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey4),
                      borderRadius: BorderRadius.circular(14)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.grey4),
                      borderRadius: BorderRadius.circular(14))),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (controller.selected == null) {
                  controller.create();
                } else {
                  controller.edit();
                }
              },
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(vertical: 13),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(14)),
                child: Text(
                  controller.selected == null ? "Qo'shish" : "Tahrirlash",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
