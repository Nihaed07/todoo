// import 'package:demo/tudo/tudoo.dart';
// import 'package:demo/whatsapp/chats.dart';
import 'package:flutter/material.dart';
import 'package:tudoo/todoo/todoohome.dart';

class TodooSplash extends StatefulWidget {
  const TodooSplash({super.key});

  @override
  State<TodooSplash> createState() => _TodooSplashState();
}

class _TodooSplashState extends State<TodooSplash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Todoohome()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.checklist, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              textAlign: TextAlign.center,
              'Todoo App',
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
