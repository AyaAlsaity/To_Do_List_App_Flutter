import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../module/database.dart';
import '../subpages/dialog_box.dart';
import '../subpages/drawer_menu.dart';
import '../subpages/todo_tile.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';

import 'details_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  //   PageController page = PageController();
  // SideMenuController sideMenu = SideMenuController();


  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // sideMenu.addListener((p0) {
    //   page.jumpToPage(p0);
    // });

    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      if(db.toDoList[index][1]==true){
        saveNewTaskDone(index);
      }
      
    });
    db.updateDataBase();
  }

    void checkBoxChangedDone(bool? value, int index) {
    setState(() {
      db.toDoListDone[index][1] = !db.toDoListDone[index][1];
      if(db.toDoListDone[index][1]==false){
        saveNewTaskNotDone(index);
      }
      
    });
    db.updateDataBaseDone();
  }

  void saveNewTaskDone(int index) {
    setState(() {
      db.toDoListDone.add(db.toDoList[index]);
      deleteTask(index);
    });
    db.updateDataBaseDone();
  }
   void saveNewTaskNotDone(int index) {
    setState(() {
      db.toDoList.add(db.toDoListDone[index]);
      deleteTaskDone(index);
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }
  void deleteTaskDone(int index) {
    setState(() {
      db.toDoListDone.removeAt(index);
    });
    db.updateDataBaseDone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        
        
        title:Text(
          "To Do List",
          style:TextStyle(color: Colors.white, fontSize: 20,) ,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 27),
              child: Icon(Icons.person),
            ),
          ],
      ),
      drawer: Drawer(
        child:DrawerMenu(),
      ),
       floatingActionButton: FloatingActionButton(
        backgroundColor:  Colors.deepPurpleAccent.shade100,
        onPressed: createNewTask,
        child: Icon(Icons.add,),
      ),
      body:DefaultTabController(
        length: 2,
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(15.0),
               child: TabBar(
                indicatorColor:Colors.deepPurpleAccent.shade100,
                tabs: [
                Text(
                   'WAITING',
                  style:TextStyle(color: Colors.deepPurpleAccent.shade100, fontSize: 17,) ,
                ),
                Text(
                   'Done',
                   style:TextStyle(color: Colors.deepPurpleAccent.shade100, fontSize: 17,) ,
                ),
            ]),
             ),
            Expanded(
              child: TabBarView(children: [
                Center(
                    child:  ListView.builder(
                      itemCount: db.toDoList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: ToDoTile(
                            taskName: db.toDoList[index][0],
                            taskCompleted: db.toDoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            deleteFunction: (context) => deleteTask(index),
                          ),
                          // onTap: () =>Navigator.of(context).push(DetailsPage(detailTask:db.toDoList[index] ?? ' ',)) ,
                
                        );
                      },
                    ),
                ),
              
                Center(
                    child:  ListView.builder(
        itemCount: db.toDoListDone.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoListDone[index][0],
            taskCompleted: db.toDoListDone[index][1],
            onChanged: (value) => checkBoxChangedDone(value, index),
            deleteFunction: (context) => deleteTaskDone(index),
          );
        },
      ),
                ),
              
              ]),
            ),
            
          ],
        ),
      ),
    
    );
  }
}

