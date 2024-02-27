import 'dart:html';


import 'package:bookstore/services/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comments_events.dart';
import 'comments_states.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState>{
  final BookService _bookService;
  final int id;

  CommentsBloc(this._bookService,this.id):super(CommentsLoadingState()){
    on<LoadCommentsPrezentationEvent>((event, emit) async {
      emit(CommentsLoadingState());
      try{
        print(id);
        final book = await _bookService.getBook(id);
        emit(CommentsLoadedState(book.comments));
      }catch(e){
        emit(CommentsErrorState(e.toString()));
      }
    });
  }
}