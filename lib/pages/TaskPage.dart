import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/services/tasks_tile.dart';
import 'package:todo_app/services/confirm.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key} );

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _box  = Hive.box('databox');
  final currController = TextEditingController();

  taskDatbase db = taskDatbase();
  @override
  void initState() {

    if (_box.get("TODOLIST")  == null) {
      db.initDatabase();
     } else {
      db.loadDatabase();
     }
    super.initState();
  }

  void checkBoxClicked(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !(db.todoList[index][1]);
      const TextStyle(decoration: TextDecoration.lineThrough);
    });
    db.updateDatabase();
  }

  void saveTask(){
    setState(() {
      db.todoList.add([currController.text , false]);
    });
    currController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }


  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return confirmAction(
            controller: currController,
            onSave: saveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    db.updateDatabase();
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 114, 167, 192),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(31, 172, 153, 153),
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text("Tasks"),
        titleTextStyle: const TextStyle(fontSize: 40, color: Colors.white),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return Tasks(
              onChanged: (value) => checkBoxClicked(value, index),
              taskDone: db.todoList[index][1],
              taskName: db.todoList[index][0],
              deleteFunction: (context) => deleteTask(index),);
        },
      ),
    );
  }
}
