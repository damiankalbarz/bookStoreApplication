import 'package:bookstore/widget/bookList/bookList_bloc.dart';

import 'package:bookstore/services/book_service.dart';
import 'package:bookstore/widget/bookPrezentation/bookPrezentation_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../models/Book.dart';
import '../../models/Comment.dart';
import 'comments_bloc.dart';
import 'comments_events.dart';
import 'comments_states.dart';


class CommentsPrezentation extends StatefulWidget{
  final int id;
  CommentsPrezentation({ required this.id});

  @override
  State<StatefulWidget> createState() => _CommentsPrezentationState(id: id);
}

class _CommentsPrezentationState extends State<CommentsPrezentation> {
  final int id;
  late final CommentsBloc _commentsBloc;
  late BookService _bookServise;
  _CommentsPrezentationState({required this.id});

  @override
  void initState() {
    super.initState();
    _bookServise = BookService();
    _commentsBloc = CommentsBloc(_bookServise, id);
    _commentsBloc.add(LoadCommentsPrezentationEvent());

  }


  @override
  Widget build(BuildContext context) {
    return Container(child: BlocConsumer(
        bloc: _commentsBloc,
        listenWhen: (previous, current) => current is CommentsLoadingState,
        buildWhen: (previous, current) => current is! CommentsLoadingState,
        listener: (context, state) {},
        builder: (context, state) {
          if(state is CommentsLoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is CommentsLoadedState){
            List<Comment> comments = state.comments;
            return ListView.builder(itemCount: comments.length,
                itemBuilder: (_,index){
                  return Card(
                      color: Colors.blue,
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        onTap: () { },
                        title: Text("${comments[index].text}"),
                      )
                  );
                });
          }

          if(state is CommentsErrorState){
            return(Center( child: Text("Bład"),));
          }
          else{
            return Container();
          }
        }
    ));
  }

}