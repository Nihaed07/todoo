import 'package:flutter/material.dart';

class TodooProvider extends ChangeNotifier {
  List<Map<String, dynamic>> tasks = [
    // {"title": "Task 1", "checked": false},
  ];
  void checkbox(int index) {
    tasks[index]["checked"] = !tasks[index]["checked"];
    notifyListeners();
  }

  void del(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  void addTask(String title) {
    if(title.isNotEmpty){
         tasks.add({"title": title, "checked": false});
    notifyListeners();
    }
 
  }

  void edit(int index,String newTitle){
    tasks[index]["title"]=newTitle;
    notifyListeners();
  }


}
