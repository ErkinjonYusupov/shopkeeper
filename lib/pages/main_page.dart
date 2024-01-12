import 'package:shopkeeper/config/imports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
    
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('data'),
            Text('data'),
            Text('data'),
            Text('data'),
          ]
        )
      ),
      body: Center(
        child: Text(
          "Projects",
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800)
        ),
      ),
    );
  }
}
