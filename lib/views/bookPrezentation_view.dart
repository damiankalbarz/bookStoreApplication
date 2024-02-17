import 'package:flutter/material.dart';

import '../widget/bookPrezentation/bookPrezentation_widget.dart';

class BookPrezentationView extends StatefulWidget{
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
      body:
        SingleChildScrollView(
          child: Column(
            children: [
              BookPrezentation(id: id),
            ],
          )
        )

    );
  }


}