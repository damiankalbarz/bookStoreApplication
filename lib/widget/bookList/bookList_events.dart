import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BookListEvent extends Equatable{
  const BookListEvent();
}

class LoadBookListEvent extends BookListEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

