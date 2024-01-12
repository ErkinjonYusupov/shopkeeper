
import 'package:shopkeeper/config/imports.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.off(()=>const MainPage());
     });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 46),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AppIcons.splash, width: 200),
              const SizedBox(height: 24),
              const Text(
                "There are no tasks in this project yet Let's add them",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 24),
              CircularProgressIndicator(
                strokeWidth: 2,
                color: AppColors.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
