import 'package:flutter/material.dart';
import 'package:todo_app/services/buttons.dart';

class confirmAction extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  confirmAction({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
    });

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 123, 151, 198),
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                    hintText: "Add Task")
                    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                button(text: "Clear", onClicked: onCancel),
                button(text: "Save", onClicked: onSave)
                
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
