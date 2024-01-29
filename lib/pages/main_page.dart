import 'package:shopkeeper/config/imports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(controller.menus.length, (index) {
                    var item = controller.menus[index];
                    return GestureDetector(
                      onTap: () {
                        controller.setPage(item.id);
                      },
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        SvgPicture.asset(
                          item.icon,
                          width: 25,
                          color: controller.isCurrenPage(item.id)
                              ? AppColors.primary
                              : null,
                        ),
                        Text(item.title,
                            style: TextStyle(
                                color: controller.isCurrenPage(item.id)
                                    ? AppColors.primary
                                    : null,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                      ]),
                    );
                  }))),
          body: controller.choosePage(),
        );
      },
    );
  }
}
