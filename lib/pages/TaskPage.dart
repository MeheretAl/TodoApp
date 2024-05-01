import 'package:flutter/material.dart';
import 'package:todo_app/services/tasks_tile.dart';
import 'package:todo_app/services/confirm.dart';

class TaskPage extends StatefulWidget {
  TaskPage({super.key} );

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final currController = TextEditingController();
  List taskList = [
    ["make tutorial", false],
    ["win bet", false]
  ];

  void checkBoxClicked(bool? value, int index) {
    setState(() {
      taskList[index][1] = !(taskList[index][1]);
      TextStyle(decoration: TextDecoration.lineThrough);
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return confirmAction(
            controller: currController,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 167, 192),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(31, 172, 153, 153),
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Tasks"),
        titleTextStyle: const TextStyle(fontSize: 40, color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
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
