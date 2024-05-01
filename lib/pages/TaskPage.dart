import 'package:flutter/material.dart';
import 'package:todo_app/services/tasks_tile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List taskList = [
    ["make tutorial", false],
    ["yo yo", true]
  ];

  void checkBoxClicked(bool? value, int index) {
    setState(() {
      taskList[index][1] = !(taskList[index][1]);
      TextStyle(decoration: TextDecoration.lineThrough);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        toolbarHeight: 120,
        centerTitle: true,
        title: const Text("Tasks"),
        titleTextStyle: const TextStyle(fontSize: 40, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return Tasks(
              onChanged: (value) => checkBoxClicked(value, index),
              taskDone: taskList[index][1],
              taskName: taskList[index][0]);
        },
      ),
    );
  }
}
