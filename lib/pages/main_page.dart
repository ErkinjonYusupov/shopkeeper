import 'package:shopkeeper/config/imports.dart';
import 'package:shopkeeper/stores/main_controller.dart';

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
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          item.icon,
                          width: 25,
                        ),
                        Text(item.title,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500))
                      ],
                    );
                  }))),
          body: const Center(
            child: Text("Projects",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800)),
          ),
        );
      },
    );
  }
}
