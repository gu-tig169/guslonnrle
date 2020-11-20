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
    textEditingController.addListener(() {
      setState(() {
        assignment = textEditingController.text;
      });
     });
  }

  Widget build(buildContext){
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('TIG169 TODO'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'What are you going to do?',),),
          FlatButton(
                  child: Text('+ ADD', style: TextStyle(color: Colors.black, fontSize: 16)),
                  onPressed: () {
                  Navigator.pop(context, TodoAssignment(assignment: assignment));
              },
          ),
        ],
      )
     
    );
 }    
      
      
      
      
}