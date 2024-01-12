import 'package:shopkeeper/config/imports.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito'
      ),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}


