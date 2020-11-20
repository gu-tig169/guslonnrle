import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'TodoListView.dart';
import 'model.dart';


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
      home: TodoListView(),
      
    );
  }
}
