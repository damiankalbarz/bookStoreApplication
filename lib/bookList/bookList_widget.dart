import 'package:bookstore/bookList/bookList_bloc.dart';
import 'package:bookstore/bookList/bookList_events.dart';
import 'package:bookstore/bookList/bookList_states.dart';
import 'package:bookstore/book_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc(RepositoryProvider.of<BookService>(context),
      )..add(LoadBookListEvent()),
      child: Scaffold(
        body: BlocBuilder<BookListBloc,BookListState>(
          builder: (context, state){
            if(state is BookListState){
              return const Center(
                child: CircularProgressIndicator(),
              )
            }
            return Container();
          }
        )
      )
    );
  }

}