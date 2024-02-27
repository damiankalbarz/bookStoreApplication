import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class CommentsEvent extends Equatable{
  const CommentsEvent();
}

class LoadCommentsPrezentationEvent extends CommentsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

