import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import '../../models/Book.dart';



@immutable
abstract class BookPrezentationState extends Equatable{}

class BookPrezentationLoadingState extends BookPrezentationState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class BookPrezentationLoadedState extends BookPrezentationState{
  final Book book;

  BookPrezentationLoadedState(this.book);

  List<Object?> get props => [book];

}


class BookPrezentationErrorState extends BookPrezentationState{
  final String error;

  BookPrezentationErrorState(this.error);

  List<Object?> get props => [error];

}