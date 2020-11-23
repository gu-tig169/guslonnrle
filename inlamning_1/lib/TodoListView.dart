import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './TodoList.dart';
import './EditTodoView.dart';


class TodoListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('TIG169 TODO')),
        
      body: Consumer<MyState>(builder: (context,state,child) => TodoList(state.list),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
      onPressed: () async{
        var newTodo = await Navigator.push(
          context,
          MaterialPageRoute(
           builder: (context)=> EditTodoView(
            TodoAssignment())));
        if(newTodo != null){
          Provider.of<MyState>(context, listen: false).addTodo(newTodo);
        } 
      },
      ),
    );
  }
}