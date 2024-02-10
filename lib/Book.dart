class Book{
  final int id;
  final String title;
  final String author;
  final String category;
  final String description;
  final int price;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.category,
    required this.description,
    required this.price
  });

  factory Book.fromJson(Map<String, dynamic> json){
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      price: json['price']
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