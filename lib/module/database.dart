import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  List toDoListDone = [];

  final _myBox = Hive.box('mybox');
  void createInitialData() {
    toDoList = [
      ["Aya Alsaity0", false],
      ["Aya Alsaity1", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }

  ///////////////////
  
  final _myBoxDone = Hive.box('mybox');
  void createInitialDataDone() {
    toDoListDone = [
      
    ];
  }

  void loadDataDone() {
    toDoListDone = _myBoxDone.get("TODOLIST");
  }

  void updateDataBaseDone() {
    _myBoxDone.put("TODOLIST", toDoListDone);
  }
}
