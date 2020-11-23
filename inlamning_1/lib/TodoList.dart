import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
class TodoList extends StatelessWidget{
  final List<TodoAssignment> list;
  TodoList(this.list);
  final firstvalue=false;
  final secondvalue=true;

  Widget build(BuildContext context){
    return ListView(
      children: list.map((todo)=>_todoItem(context, todo)).toList());
  }

  Widget _todoItem(context, todo) {
    return CheckboxListTile(
      value: this.firstvalue,
      title: Text(todo.assignment),
      secondary: IconButton(
        icon: Icon(Icons.coronavirus_sharp), // Haha! Tyckte det var otroligt kul att det fanns en corona-icon.
        onPressed: (){                       // Tänker att man klickar på den när något inte sker pga corona, och då tas den bort.
          var state = Provider.of<MyState>(context, listen: false);
          state.removeTodo(todo);

        },
      ),
      
      onChanged: (bool newVvalue) {
        
        });
        
              //Här vill jag göra så att det kryssas för när man klickar på rutan.   
            // Men det hann jag inte riktigt göra.
    
  }
}