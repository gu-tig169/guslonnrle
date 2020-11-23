import 'package:flutter/material.dart';

class TodoAssignment{
  String assignment;
  TodoAssignment({this.assignment});
}

class MyState extends ChangeNotifier{
  List <TodoAssignment> _list =[]; 

  List<TodoAssignment> get list => _list;

  void addTodo(TodoAssignment todo) {
    _list.add(todo);
    notifyListeners();
  }
  void removeTodo(TodoAssignment todo) {
    _list.remove(todo);
    notifyListeners();
  }
}