import 'package:flutter/material.dart';
import 'Api.dart';

String boolToString(bool done){
  if (done==false) {
    return 'false';
  } if (done==true) {
    return 'true';
  }
  return 'false';
}

stringToBool(String done) {
  if (done=='false') return false;
  if (done=='true') return true;
return false;
}

class TodoAssignment{
  String assignment;
  String id;
  bool done;

  TodoAssignment({this.assignment, this.done=false, this.id});
 

  static Map<String,dynamic> toJson(TodoAssignment todo) {
    return {
      'title': todo.assignment,
      'done' : boolToString(todo.done),
      };
  }
  static TodoAssignment fromJson(Map<String,dynamic> json) {
    return TodoAssignment(
      id: json['id'],
      assignment: json['title'],
      done: stringToBool(json['done']),
    );
  }
    void completed() {
    done = !done;
  }
}


class MyState extends ChangeNotifier{

  String _filterValue = "All";

  List <TodoAssignment> _todos =[]; 

  List<TodoAssignment> get list => _todos;

  Future getList() async{
    List<TodoAssignment> list =await Api.getTodos();
    _todos = list;
    notifyListeners();
  }

  void addingTodo(TodoAssignment todo) async {
    await Api.addingTodo(todo);
    await getList();
  }

  void removingTodo(TodoAssignment todo) async {
    await Api.deleteTodo(todo.id);
    await getList();
  }

  List<TodoAssignment> _filteredTodos;

  List<TodoAssignment> filtering(List<TodoAssignment> _todos, String _filterValue){
    if (_filterValue == "All") {
      _filteredTodos = _todos;
    } else if (_filterValue=="Done") {
      _filteredTodos = _todos.where((i) => i.done ==true).toList();
    } else if(_filterValue=="Undone") {
      _filteredTodos = _todos.where((i) => i.done ==false).toList();
    }
    return _filteredTodos;
  }

 List get getTodos {
    if (_todos.length == 0) {
      var task = new TodoAssignment(assignment: "eat pizza", done: false);
      _todos.add(task);
      var task2 = new TodoAssignment(assignment: "go to the gym", done: false);
      _todos.add(task2);
      var task3 = new TodoAssignment(assignment: "call grandma", done: true);
      _todos.add(task3);
      var task4 = new TodoAssignment(assignment: "go for a run", done: true);
      _todos.add(task4);
      var task5 = new TodoAssignment(assignment: "meditate", done: false);
      _todos.add(task5);
      var task6 = new TodoAssignment(assignment: "buy vegetables", done: false);
      _todos.add(task6);
      var task7 = new TodoAssignment(assignment: "play guitar", done: true);
      _todos.add(task7);
    }
    return filtering(_todos, _filterValue);
  }


  void addTodo(TodoAssignment todo) {
    _filterValue= "All";
    _todos.add(todo);
    notifyListeners();
  }
  void removeTodo(TodoAssignment todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  useFilter() {
    notifyListeners();
    return filtering;
  }
  getTodo(done, index) {
    if(getTodos[index].done==false) {
      return Text(getTodos[index].assignment);
    } else {
      return Text(getTodos[index].assignment,
        style: TextStyle(decoration: TextDecoration.lineThrough)); 
    }
  }
  bool getDone(index) {
    return getTodos[index].done;
  }
  void setFilterValue(newValue) {
    _filterValue = newValue;
  }
  void setDone(index, bool testValue) {
    getTodos[index].completed();
    notifyListeners();
  }
    void delete(index) {  
    getTodos.removeAt(index);
    notifyListeners();
  }
}