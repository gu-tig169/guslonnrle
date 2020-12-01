import 'package:http/http.dart' as http;
import 'package:inlamning_1/model.dart';
import 'dart:convert';

const API_URL = "https://todoapp-api-vldfm.ondigitalocean.app";
const API_KEY = "0263db5e-712c-4e2e-bc58-7cf948234c9f";

class Api {
  
  static Future addingTodo(TodoAssignment todo, {String assignment}) async {
    Map<String,dynamic> json = TodoAssignment.toJson(todo);
    var bodyString= jsonEncode(json);
    await http.post(
      '$API_URL/todos?key=$API_KEY', 
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
  }

  static Future deleteTodo(String id) async {
    await http.delete('$API_URL/todos/$id?key=$API_KEY');
  }

  static Future<List<TodoAssignment>> getTodos() async{
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    String bodyString = response.body;
    var json = jsonDecode(bodyString);
    return json.map<TodoAssignment>((data){
      return TodoAssignment.fromJson(data);
    }).toList();
  }

  static Future updateTodo(TodoAssignment todo) async {
    String id = todo.id;

    Map<String, dynamic> json = TodoAssignment.toJson(todo);
    var bodyString = jsonEncode(json);
    print(bodyString);
    await http.put('$API_URL/todos/$id?key=$API_KEY',
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
      ); 
  }
}