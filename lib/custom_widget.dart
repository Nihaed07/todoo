import 'package:flutter/material.dart';

class customlisttile extends StatelessWidget {
  final Widget? check;
  IconData? editicon;
  IconData? deleteicon;
  Color? color;
  String title;
  bool? checkbovalue;
  Function(bool?)? onChanged;
  Function()? deletepress;
  Function()? editpress;
  bool underline;
  

  customlisttile({
    // super.key,
    this.check,
    required this.checkbovalue,
    required this.color,
    required this.deleteicon,
    required this.deletepress,
    required this.editicon,
    required this.editpress,
    required this.title,
    required this.onChanged,
    required this.underline,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(deleteicon, color: color),
            onPressed: deletepress,
          ),
          IconButton(icon: Icon(editicon), onPressed: editpress),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          decoration: underline
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      leading: Checkbox(value: checkbovalue, onChanged: onChanged),
    );
  }
}

class alert extends StatelessWidget {
  final Function()? Okfun;
  final Function()? cancelfun;
  TextEditingController updatecontroller;
  alert({
    super.key,
    required this.Okfun,
    required this.cancelfun,
    required this.updatecontroller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextFormField(
        controller: updatecontroller,
        decoration: InputDecoration(
          hintText: 'Enter your task',
          hintStyle: TextStyle(fontSize: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      title: Text('Update data'),
      actions: [
        TextButton(onPressed: Okfun, child: Text("Ok")),
        TextButton(onPressed: cancelfun, child: Text("Cancel")),
      ],
    );
  }
}
