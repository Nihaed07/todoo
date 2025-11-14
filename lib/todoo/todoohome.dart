import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tudoo/custom_widget.dart';
import 'package:tudoo/todoo/todoo_provider.dart';

class Todoohome extends StatelessWidget {
  Todoohome({super.key});

  final titleCtr = TextEditingController();
  final updateCtr = TextEditingController();

  bool checked = false;
  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<TodooProvider>(context);
    final getFunction = Provider.of<TodooProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text(
            'Todo Home',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: titleCtr,
                    decoration: InputDecoration(
                      hintText: 'Enter your task',
                      hintStyle: TextStyle(fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    getFunction.addTask(titleCtr.text.trim());
                    titleCtr.clear();
                  },
                  child: Icon(Icons.add, color: Colors.black),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: getData.tasks.length,
                itemBuilder: (context, index) {
                  return customlisttile(
                    underline: getData.tasks[index]["checked"],
                    colors: getData.tasks[index]["checked"],
                    checkbovalue: getData.tasks[index]["checked"],
                    color: Colors.red,
                    deleteicon: Icons.delete,
                    deletepress: () {
                      getFunction.del(index);
                    },
                    editicon: Icons.edit,
                    editpress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return alert(
                            Okfun: () {
                              getFunction.edit(index, updateCtr.text.trim());
                              Navigator.pop(context);
                            },
                            cancelfun: () {
                              Navigator.pop(context);
                            },
                            updatecontroller: updateCtr,
                          );
                        },
                      );
                    },

                    title: getData.tasks[index]["title"],
                    onChanged: (val) {
                      getFunction.checkbox(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
