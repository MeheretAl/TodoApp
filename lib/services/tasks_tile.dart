import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tasks extends StatelessWidget {
  final String taskName;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext?)? deleteFunction;

  Tasks({
    Key? key,
    required this.taskName,
    required this.taskDone,
    required this.onChanged,
    required this.deleteFunction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,)

        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 100, 185, 255),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskDone,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: taskDone
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 4)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
