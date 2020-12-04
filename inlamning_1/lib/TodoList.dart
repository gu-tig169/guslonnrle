import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './model.dart';
import './EditTodoView.dart';


class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        centerTitle:true,
        title: Text('TIG169 TODO',
          style: TextStyle(
            color: Colors.white
          )
        ), 
        actions: [_popupButton()]),       
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[600],
        child: Icon(Icons.add,
          color: Colors.white
        ),
        
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
            contentPadding: state.getTodos.length==index+1? EdgeInsetsDirectional.only(start:20, top:20, bottom: 100, end: 20): EdgeInsetsDirectional.only(start:20, top:20, end: 20),
            leading: 
            Checkbox(
              checkColor: Colors.white,
              activeColor: Colors.blue[600],
              value: state.getDone(index),
              onChanged: (bool done) {
                state.updateTodoByIndex(index, done);
              },
            ),
            title: state.getTodo(state, index),
            trailing: IconButton(
            icon: Icon(Icons.coronavirus_sharp, color: Colors.red),
              onPressed: (){      
                state.delete(index);
              },
            ),  
          );
        },
      )
    );
  }

    Widget _popupButton(){
    return Consumer <MyState> (
      builder: (context, state, child) => PopupMenuButton(
        color: Colors.white,
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
