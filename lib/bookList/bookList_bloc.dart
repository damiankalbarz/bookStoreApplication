import 'package:bookstore/bookList/bookList_events.dart';
import 'package:bookstore/bookList/bookList_states.dart';
import 'package:bookstore/book_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListBloc extends Bloc<BookListEvent, BookListState>{
  final BookService _bookService;

  BookListBloc(this._bookService):super(BookListLoadingState()){
    on<LoadBookListEvent>((event, emit) async {
      emit(BookListLoadingState());
    });
  }
}