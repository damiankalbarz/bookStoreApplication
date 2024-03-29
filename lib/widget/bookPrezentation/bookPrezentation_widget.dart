import 'package:bookstore/widget/bookList/bookList_bloc.dart';

import 'package:bookstore/services/book_service.dart';
import 'package:bookstore/widget/bookPrezentation/bookPrezentation_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../models/Book.dart';
import 'bookPrezentation_bloc.dart';
import 'bookPrezentation_states.dart';

class BookPrezentation extends StatefulWidget{
  final int id;
  BookPrezentation({ required this.id});

  @override
  State<StatefulWidget> createState() => _BookPrezentationState(id: id);
}

class _BookPrezentationState extends State<BookPrezentation> {
  final int id;
  late final BookPrezentationBloc _bookPrezentationBloc;
  late BookService _bookServise;
  _BookPrezentationState({required this.id}) {}
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _bookServise = BookService();
    _bookPrezentationBloc = BookPrezentationBloc(_bookServise, id);
    _bookPrezentationBloc.add(LoadBookPrezentationEvent());

  }


  @override
  Widget build(BuildContext context) {
    return Container(child: BlocConsumer(
      bloc: _bookPrezentationBloc,
        listenWhen: (previous, current) => current is BookPrezentationLoadingState,
        buildWhen: (previous, current) => current is! BookPrezentationLoadingState,
      listener: (context, state) {},
      builder: (context, state) {
        if(state is BookPrezentationLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if(state is BookPrezentationLoadedState){
          Book book = state.book;
          return Container(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(book.title, style: TextStyle(fontSize: 40),),
                Text(book.author, style: TextStyle(fontSize: 20)),
                SizedBox(height: 5,),
                Text(book.category, style: TextStyle(fontSize: 13)),
                SizedBox(height: 10,),
                Divider(
                  height: 20, // Wysokość kreski
                  thickness: 2, // Grubość kreski
                  color: Colors.black, // Kolor kreski
                ),
                SizedBox(height: 10,),
                Text(book.description, style: TextStyle(fontSize: 14)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      _bookServise.addLike(book.id);
                    }, icon: Icon(Icons.thumb_up_alt_outlined)),
                    Text(book.likeCount.toString()),
                    SizedBox(width: 20,),
                    IconButton(onPressed: (){
                      _bookServise.addHate(book.id);
                      },
                        icon: Icon(Icons.thumb_down_alt_outlined)),
                    Text(book.hateCount.toString()),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextFormField(
                        controller: commentController,
                        decoration: const InputDecoration(
                          labelText: 'Napisz swój komentarz',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    IconButton(onPressed: (){
                      print("com");
                      _bookServise.addComment(book.id, commentController.text);
                    },
                        icon: Icon(Icons.add_circle, size: 35,)),
                  ],
                ),
              ],
            )

          );
        }

        if(state is BookPrezentationErrorState){
          return(Center( child: Text("Bład"),));
        }
        else{
          return Container();
    }
      }
    ));
  }

}