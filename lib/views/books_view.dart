import 'package:bookstore/views/login_view.dart';
import 'package:flutter/material.dart';

import '../widget/bookList/bookList_widget.dart';

class BooksPage extends StatefulWidget{
@override
State<StatefulWidget> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boooook"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.accessibility_sharp),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: BookList(),
    );
  }

}