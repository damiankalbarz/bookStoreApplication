import 'package:bookstore/widget/bookList/bookList_bloc.dart';

import 'package:bookstore/services/book_service.dart';
import 'package:bookstore/widget/bookPrezentation/bookPrezentation_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../models/Book.dart';
import 'bookPrezentation_bloc.dart';
import 'bookPrezentation_states.dart';

class BookPrezentation extends StatefulWidget{
  final int id;
  BookPrezentation({ required this.id});

  @override
  State<StatefulWidget> createState() => _BookPrezentationState(id: id);
}

class _BookPrezentationState extends State<BookPrezentation> {
  final int id;
  late final BookPrezentationBloc _bookPrezentationBloc;
  late BookService _bookServise;
  _BookPrezentationState({required this.id}) {}

  @override
  void initState() {
    super.initState();
    _bookServise = BookService();
    _bookPrezentationBloc = BookPrezentationBloc(_bookServise, id);
    _bookPrezentationBloc.add(LoadBookPrezentationEvent());

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold( body: BlocConsumer(
      bloc: _bookPrezentationBloc,
        listenWhen: (previous, current) => current is BookPrezentationLoadingState,
        buildWhen: (previous, current) => current is! BookPrezentationLoadingState,
      listener: (context, state) {},
      builder: (context, state) {
        if(state is BookPrezentationLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if(state is BookPrezentationLoadedState){
          Book book = state.book;
          return Container(
            child: Column(
              children: [
                Text(book.title),
                Text(book.author),
                Text(book.category),
                Text(book.description),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up_alt_outlined)),
                    Text(book.likeCount.toString()),
                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down_alt_outlined)),
                    Text(book.likeCount.toString()),
                  ],
                )


              ],
            )

          );
        }

        if(state is BookPrezentationErrorState){
          return(Center( child: Text("Bład"),));
        }
        else{
          return Container();
    }
      }
    ));

      /*
      create: (context) => BookPrezentationBloc(
        RepositoryProvider.of<BookService>(context!),id!
      )..add(LoadBookPrezentationEvent()),
      child: Scaffold(
        body: BlocBuilder<BookPrezentationBloc,BookPrezentationState>(
          builder: (context, state){
            if(state is BookPrezentationLoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(state is BookPrezentationLoadedState){
              Book book = state.book;
              return Container(
                child: Text("dsfsf"),
              );
            }

            if(state is BookPrezentationErrorState){
              return(Center( child: Text("Bład"),));
            }
            return Container();
          }
        )

    );*/
  }

}