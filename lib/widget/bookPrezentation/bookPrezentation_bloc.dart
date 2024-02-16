import 'dart:html';


import 'package:bookstore/services/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookPrezentation_events.dart';
import 'bookPrezentation_states.dart';

class BookPrezentationBloc extends Bloc<BookPrezentationEvent, BookPrezentationState>{
  final BookService _bookService;
  final int id;

  BookPrezentationBloc(this._bookService,this.id):super(BookPrezentationLoadingState()){
    on<LoadBookPrezentationEvent>((event, emit) async {
      emit(BookPrezentationLoadingState());
      try{
        print("dddd");
        print(id);
        final book = await _bookService.getBook(id);
        emit(BookPrezentationLoadedState(book));
      }catch(e){
        emit(BookPrezentationErrorState(e.toString()));
      }
    });
  }
}