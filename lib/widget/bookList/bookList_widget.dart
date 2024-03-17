import 'package:bookstore/widget/bookList/bookList_bloc.dart';

import 'package:bookstore/services/book_service.dart';
import 'package:bookstore/widget/bookPrezentation/bookPrezentation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../models/Book.dart';

import '../../views/bookPrezentation_view.dart';
import 'bookList_events.dart';
import 'bookList_states.dart';

class BookList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        BookListBloc(
          RepositoryProvider.of<BookService>(context),
        )
          ..add(LoadBookListEvent()),
        child: BlocBuilder<BookListBloc, BookListState>(
            builder: (context, state) {
              if (state is BookListLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is BookListLoadedState) {
                List<Book> bookList = state.books;
                Set<String> category = {};
                category.add('All');
                for(Book book in bookList){
                  category.add(book.category);
                }
                return Container(child:
                Column(children: [
                  Container(child:
                  DropdownButton<String>(
                    value: selectedCategory,
                    onChanged: (String ?newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: category
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  ),
                  Expanded(child: ListView.builder(itemCount: bookList.length,
                      itemBuilder: (_, index) {
                        return Card(
                            color: Colors.blue,
                            elevation: 3,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      BookPrezentationView(
                                          id: bookList[index].id),),);
                              },
                              title: Text("${bookList[index]
                                  .title}    -     ${bookList[index].author}"),
                              subtitle: Text(bookList[index].category),

                            )
                        );
                      }),),
                ]
                  ,
                )
                );
              }

              if (state is BookListErrorState) {
                return (Center(child: Text("Bład"),));
              }
              return Container();
            }));
  }

}