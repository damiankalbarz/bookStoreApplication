import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


import '../../models/Book.dart';
import '../../models/Comment.dart';



@immutable
abstract class CommentsState extends Equatable{}

class CommentsLoadingState extends CommentsState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CommentsLoadedState extends CommentsState{
  final List<Comment> comments;

  CommentsLoadedState(this.comments);



  List<Object?> get props => [comments];

}


class CommentsErrorState extends CommentsState{
  final String error;

  CommentsErrorState(this.error);

  List<Object?> get props => [error];

}