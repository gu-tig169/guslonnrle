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
        title: Text('TIG169'),
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
            _image(),
            Container(
                margin: EdgeInsets.only(left: 16, top: 24),
                child: Text('Name')),
            Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: TextField(
                    decoration: InputDecoration(hintText: 'Your name'))),
            Container(height: 24),
            _checkboxRow(),
            Container(height: 24),
            _iconRow(),
            Container(height: 18),
            _buttonRow(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Container(
      height: 53,
      decoration: BoxDecoration(color: Colors.blue),
      child: Center(
        child: Text(
          'Title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Stack(
      children: [
        Image(image: AssetImage('assets/stefan.jpg')),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            height: 101,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(0, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          child: Text(
            'Heja Stefan',
            style: TextStyle(fontSize: 46),
          ),
        )
      ],
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
      appBar: AppBar(),
      body: _list(),
    );
  }

  Widget _list() {
    var list = ['Jonas', 'Leo', 'Klas', 'Inge',];
    return ListView(
      children: 
        list.map((item) => _item(item)).toList(),
        
    );
  }

  Widget _item(text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(text, style: TextStyle(fontSize: 36)),
    );
  }
}
