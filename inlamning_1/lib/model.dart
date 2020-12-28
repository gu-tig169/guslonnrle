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
      'id' : todo.id != null ? todo.id : '',
      'title': todo.assignment,
      'done' : boolToString(todo.done)  
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
    this.done = !done;
  }

}


class MyState extends ChangeNotifier{

  String _filterValue = "All";

  List <TodoAssignment> _todos = []; 

  List<TodoAssignment> get list => _todos;

  Future getList() async{
    List<TodoAssignment> list =await Api.getTodos();
    _todos = list;
    notifyListeners();
  }

  void addingTodo(TodoAssignment todo) async {
    await Api.addingTodo(todo);
    await getList();
    notifyListeners();
  }

  void removingTodo(TodoAssignment todo) async {
    await Api.deleteTodo(todo.id);
    await getList();
    notifyListeners();
  }

  void updatingTodo(TodoAssignment todo) async {
    await Api.updateTodo(todo);
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
    return filtering(_todos, _filterValue);
  }

  void addTodo(TodoAssignment todo) async{
    addingTodo(todo);
    _filterValue= "All";
    _todos.add(todo);
    await getList();
    notifyListeners();
  }
  void removeTodo(index) {
    _todos.remove(index);
    notifyListeners();
  }

  useFilter() {
    notifyListeners();
    return filtering;
  }
  getTodo(done, index) {
    if(getTodos[index].done==false) {
      return Text(getTodos[index].assignment, style: TextStyle(fontSize: 20));
    } else {
      return Text(getTodos[index].assignment,
        style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough,)); 
    }
  }

  bool getDone(index) {
    return getTodos[index].done;
  }

  void setFilterValue(newValue) {
    _filterValue = newValue;
  }

  void delete(index) {  
    removingTodo(getTodos[index]);
    getTodos.removeAt(index);
    notifyListeners();
  }

  updateTodoByIndex(index) {
    TodoAssignment todoToUpdate = getTodos[index];
    todoToUpdate.completed();
    updatingTodo(todoToUpdate);
    notifyListeners();
  } 
}
