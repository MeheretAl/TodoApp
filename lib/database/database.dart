import 'package:hive/hive.dart';

class taskDatbase {
  List todoList = [];

  final _box = Hive.box('databox');

  void initDatabase() {
    todoList = [
      ['make bed', false],
      ['eat breakfast', false]
    ];
  }


  void loadDatabase() {
    todoList = _box.get('TODOLIST'); 
  }


  void updateDatabase() {
    _box.put('TODOLIST', todoList);

  }
}