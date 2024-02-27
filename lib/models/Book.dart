import 'Comment.dart';

class Book{
  final int id;
  final String title;
  final String author;
  final String category;
  final String description;
  final int price;
  final int likeCount;
  final int hateCount;
  final List<Comment> comments;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.price,
    required this.likeCount,
    required this.hateCount,
    required this.comments
  });

  factory Book.fromJson(Map<String, dynamic> json){
    var list = json['comments'] as List;
    List<Comment> comments = list.map((i) => Comment.fromJson(i)).toList();
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      price: json['price'],
      likeCount: json['likeCount'],
      hateCount: json['hateCount'],
      comments: comments

    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'price': price,
    };
  }
}