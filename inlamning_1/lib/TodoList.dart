import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './EditTodoView.dart';


class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('TIG169 TODO'), 
        actions: [_popupButton()]),       
      body: _buildList(context),
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

  Widget _buildList(BuildContext context){
    return Consumer <MyState>(
      builder: (context, state, child) => ListView.builder(
        itemCount: state.getTodos.length,
        itemBuilder: (context,index,) {
          return ListTile(
            leading: Checkbox(
            value: state.getDone(index),
            onChanged: (bool done) {
              state.setDone(index, done);
            },
          ),
          title: state.getTodo(state, index),
            trailing: IconButton(
            icon: Icon(Icons.coronavirus_sharp), // Haha! Tyckte det var otroligt kul att det fanns en corona-icon.
                onPressed: (){     
                  //Api.deleteTodo(todo)                  // Tänker att man klickar på den när något inte sker pga corona, och då tas den bort.
                  state.delete(index);
                  print('index: $index');
                  print('context: $context');
                  print('child: $child');
                  print('state: $state.getID');
                  
        },
      ),
      
);
        }
        ,)
      );
  }
    Widget _popupButton(){
    return Consumer <MyState> (
      builder: (context, state, child) => PopupMenuButton(
        onSelected: (newValue) {
          state.setFilterValue(newValue);
          state.useFilter();
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("All"),
            value: "All",
            ),
          PopupMenuItem(
            child: Text("Done"),
            value: "Done",
            ),
          PopupMenuItem(
            child: Text("Undone"),
            value: "Undone",
            ),
        ],

    ));
  }
}
