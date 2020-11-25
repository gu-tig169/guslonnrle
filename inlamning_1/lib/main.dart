import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'TodoList.dart';



void main() {
  var state = MyState();
  runApp(
    ChangeNotifierProvider(
      create: (context)=>state,
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoList(),
      
    );
  }
}
