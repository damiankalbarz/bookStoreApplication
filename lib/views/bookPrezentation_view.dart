import 'package:flutter/material.dart';

import '../widget/bookPrezentation/bookPrezentation_widget.dart';

class BookPrezentationView extends StatefulWidget {
  final int id;

  BookPrezentationView({required this.id});

  @override
  State<StatefulWidget> createState() => _BookPrezentationViewState(id: id);
}

class _BookPrezentationViewState extends State<BookPrezentationView> {
  final int id;

  _BookPrezentationViewState({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boook"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          BookPrezentation(id: id),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Napisz swój komentarz',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 15,),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.add_circle, size: 35,)),
            ],
          ),
        ],
      )),
    );
  }
}
