import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudoo/todoo/todoo_provider.dart';
import 'package:tudoo/todoo/todoosplash.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TodooProvider(),),
      
    ],child: Todoomian(),)
  );
}

class Todoomian extends StatelessWidget {
  const Todoomian({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodooSplash(),
      title: 'Tdoo App',
    );
  }
}
