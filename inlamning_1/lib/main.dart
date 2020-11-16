import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO',
         style: TextStyle(color: Colors.black, fontSize: 26), ),
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert,
            color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 56),
        backgroundColor: Colors.grey,
      ),
    );
  }
    Widget _list() {
    var todolist = ['Write a book', 'Do homework', 'Tidy room', 'Watch TV','Nap', 'Shop groceries', 'Have fun', 'Meditate'];
    var newlist = List.generate(100,(index) =>'${todolist[index % 8]}');
    return ListView.builder(
      itemBuilder: (context, index) => _item(newlist[index]),
      itemCount: 8,
        
    );
  }

   Widget _item(text) {
    return CheckboxListTile(
      title: Text(text,
          style: TextStyle(
            fontSize: 26,
          )),
      secondary: Icon(Icons.cancel),
      value: false,
      onChanged: (val) {},
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
  



class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169 TODO',
         style: TextStyle(color: Colors.black, fontSize: 26), ),
        backgroundColor: Colors.grey[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 16, right: 16, top: 39),
                child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: 'What are you going to do?',)
                    )),
            Container(height: 47),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.add),
              Text('  ADD', style: TextStyle(fontSize: 16)),
              
            ],)
          ]
 
          
        ),
      ),
    );
  }

 
}
  
