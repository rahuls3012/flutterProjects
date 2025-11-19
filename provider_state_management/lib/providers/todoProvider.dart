import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider_state_management/models/todo.dart';
class Todoprovider extends ChangeNotifier {
   final Box<Todo> _todo = Hive.box<Todo>('todobox');
  
  
  List<Todo> get todo=>_todo.values.toList();
  void addTodo(String text)async{
  await  _todo.add(Todo(title: text));
    notifyListeners();
  }
  Future<void> toggletodo(int index) async{
   final todo=_todo.getAt(index)!;
   todo.isDone=!todo.isDone;
   await todo.save();
   notifyListeners();
  }
 Future <void> removeTodo(int index) async{
  _todo.deleteAt(index);
    notifyListeners();
  }
   Future <void> updateTodo(int index,String title) async{
  final todo=_todo.getAt(index)!;
  todo.title=title;
  notifyListeners();
   
    
  }
}
