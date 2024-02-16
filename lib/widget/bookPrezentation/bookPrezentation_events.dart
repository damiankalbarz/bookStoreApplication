import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BookPrezentationEvent extends Equatable{
  const BookPrezentationEvent();
}

class LoadBookPrezentationEvent extends BookPrezentationEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

