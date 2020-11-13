import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainView());
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
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
          ),
        ],
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

  Widget _checkboxRow() {
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (val) {},
        ),
        Text('Contact me')
      ],
    );
  }

  Widget _iconRow() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Icon(Icons.person),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Heading',
                style: TextStyle(fontSize: 20, color: Colors.black)),
            Text('Subheading'),
          ],
        ),
      ],
    );
  }

  Widget _buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlineButton(onPressed: () {}, child: Text('Cancel')),
        Container(width: 40),
        RaisedButton(
          onPressed: () {},
          child: Text('Save'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ],
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
       _list(),)
      
    );
  }

  Widget _list() {
    var list = ['Write a book', 'Do homework', 'Tidy room', 'Watch TV','Nap', 'Shop groceries', 'Have fun', 'Meditate'];
    return ListView(
      children: 
        list.map((item) => _item(item)).toList(),
        
    );
  }

  Widget _item(text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(text, style: TextStyle(fontSize: 26)),
    );
  }
}
