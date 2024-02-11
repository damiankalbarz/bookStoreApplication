import 'package:bookstore/bookList/bookList_bloc.dart';
import 'package:bookstore/bookList/bookList_events.dart';
import 'package:bookstore/bookList/bookList_states.dart';
import 'package:bookstore/book_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Book.dart';

class BookList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookListBloc(
        RepositoryProvider.of<BookService>(context),
      )..add(LoadBookListEvent()),
      child: Scaffold(
        body: BlocBuilder<BookListBloc,BookListState>(
          builder: (context, state){
            if(state is BookListLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is BookListLoadedState){
              List<Book> bookList = state.books;
              return ListView.builder(itemCount: bookList.length,
              itemBuilder: (_,index){
                return Card(
                  color: Colors.blue,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    title: Text("${bookList[index].title} - ${bookList[index].author}"),
                    subtitle: Text(bookList[index].category),

                  )
                );
              });
            }

            if(state is BookListErrorState){
              return(Center( child: Text("Bład"),));
            }
            return Container();
          }
        )
      )
    );
  }

}