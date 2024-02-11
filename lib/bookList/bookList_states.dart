import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../Book.dart';

@immutable
abstract class BookListState extends Equatable{}

class BookListLoadingState extends BookListState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class BookListLoadedState extends BookListState{
  final List<Book> books;

  BookListLoadedState(this.books);

  List<Object?> get props => [books];

}


class BookListErrorState extends BookListState{
  final String error;

  BookListErrorState(this.error);

  List<Object?> get props => [error];

}