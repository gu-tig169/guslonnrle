import 'package:flutter/material.dart';
import './model.dart';

class EditTodoView extends StatefulWidget {
  final TodoAssignment todo;

  EditTodoView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return EditTodoViewState(todo);
  }
}
class EditTodoViewState extends State<EditTodoView>{
  String assignment;

  TextEditingController textEditingController;

  EditTodoViewState(TodoAssignment todo) {
    this.assignment = todo.assignment;
    textEditingController= TextEditingController(text: todo.assignment);
  }

  Widget build(buildContext){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle: true,
        title: Text('TIG169 TODO', 
        style: TextStyle(
          color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(),
                hintText: 'What are you going to do?',),),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: RaisedButton(
                child: Text('+ ADD', style: TextStyle(color: Colors.white, fontSize: 16)),
                color: Colors.blue[600],
                onPressed: () {
                    Navigator.pop(context, TodoAssignment( assignment: textEditingController.text, id: null, done: false));
                  },
              ),
            ),
          ],
        ),
      )
     
    );
 }    
      
      
      
      
}