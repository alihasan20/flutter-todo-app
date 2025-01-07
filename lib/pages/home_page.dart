import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_todo_app/data/database.dart';

import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const HomePage({super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //reference the hive box
  final _myBox= Hive.box('mybox');
  ToDoDatabase db= ToDoDatabase();

  @override
  void initState() {
    // if this is the first time ever opening the app, then create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller

  final _controller=TextEditingController();

  //list of todo tasks
  List toDoList=[["Make Tutorial", false],["Do Exercise", false]];

  //save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create new task
  void createNewTask(){
    showDialog(context: context, builder: (context){return DialogBox(
      controller: _controller,
      onSave: saveNewTask,
      onCancel: () => Navigator.of(context).pop(),
    );
    },
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor, title: Center(child: Text("TO DO")),
        actions: [
          IconButton(onPressed: () => widget.toggleTheme(), icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTask, child: Icon(Icons.add),backgroundColor: Theme.of(context).floatingActionButtonTheme.backgroundColor,),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index)
        {return ToDoTile(
          taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value)=>checkBoxChanged(value,index),
          deleteFunction: (context) => deleteTask(index),
          // body: ListView(
          //   children: [
          //     ToDoTile(taskName: "Make Tutorial",taskCompleted: true,onChanged: (p0) {},
          //     ),
          //     ToDoTile(taskName: "Do Exercise",taskCompleted: false,onChanged: (p0) {},
          //     ),
          //   ],
          // ),
        );
        },
      ),
    );
  }
}