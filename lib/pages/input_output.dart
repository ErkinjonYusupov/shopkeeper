import 'package:flutter/material.dart';

class InputOutputPage extends StatefulWidget {
  const InputOutputPage({super.key});

  @override
  State<InputOutputPage> createState() => _InputOutputPageState();
}

class _InputOutputPageState extends State<InputOutputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Kirim-chiqim")),
    );
  }
}