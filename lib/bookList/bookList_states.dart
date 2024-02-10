import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BookListState extends Equatable{}

class BookListLoadingState extends BookListState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}