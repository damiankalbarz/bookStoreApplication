import 'dart:html';


import 'package:bookstore/services/auth_service.dart';
import 'package:bookstore/services/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookList_events.dart';
import 'bookList_states.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState>{
  final BookService _bookService;

  BookListBloc(this._bookService):super(BookListLoadingState()){
    on<LoadBookListEvent>((event, emit) async {
      emit(BookListLoadingState());
      try{
        final bookList = await _bookService.getBooks();
        final xd = await AuthService().login("hseeddddfas", "123fdsfds");
        emit(BookListLoadedState(bookList));
      }catch(e){
        emit(BookListErrorState(e.toString()));
      }
    });
  }
}