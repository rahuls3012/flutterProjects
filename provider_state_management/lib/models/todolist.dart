import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/models/todoviewer.dart';
import 'package:provider_state_management/providers/todoProvider.dart';

class Todolist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodolistState();
  }
}

class TodolistState extends State<Todolist> {
  bool isEditing = false;
  int? editingIndex;

  final TextEditingController tcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Todoprovider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(title: Text("ToDoList")),
        body: Column(
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: tcontroller,

                        decoration: InputDecoration(
                          hint: Text("Enter your tasks..."),
                          label: Text("New_Task"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (tcontroller.text.isEmpty) return;

                      if (!isEditing) {
                        value.addTodo(tcontroller.text);
                        tcontroller.clear();
                      } else {
                        setState(() {
                          isEditing = false;
                        });
                        value.updateTodo(editingIndex!, tcontroller.text);
                        editingIndex = null;

                        tcontroller.clear();
                      }
                    },
                    child: Text(isEditing ? "Update" : "Add+"),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.todo.length,
                itemBuilder: (context, index) {
                  final todoValue = value.todo[index];
                  return Container(
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tileColor: (index % 2 == 0)
                          ? Colors.blue
                          : const Color.fromARGB(255, 76, 153, 167),
                      leading: Checkbox(
                        value: todoValue.isDone,
                        onChanged: (_) {
                          value.toggletodo(index);
                        },
                      ),
                      title: Text(
                        value.todo[index].title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isEditing = true;
                              });
                              tcontroller.text = value.todo[index].title;
                              editingIndex = index;
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              value.removeTodo(index);
                            },
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Todoviewer()),
            );
          },
          child: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
