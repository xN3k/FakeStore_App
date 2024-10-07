import 'dart:convert';

enum Category { electronics, jewelery, mensClothing, womensClothing }

extension CategoryExtension on Category {
  String get value {
    switch (this) {
      case Category.electronics:
        return 'electronics';
      case Category.jewelery:
        return 'jewelery';
      case Category.mensClothing:
        return "men's clothing";
      case Category.womensClothing:
        return "women's clothing";
    }
  }

  static Category fromString(String value) {
    switch (value.toLowerCase()) {
      case 'electronics':
        return Category.electronics;
      case 'jewelery':
        return Category.jewelery;
      case "men's clothing":
        return Category.mensClothing;
      case "women's clothing":
        return Category.womensClothing;
      default:
        throw ArgumentError('Invalid category value: $value');
    }
  }
}

class Rating {
  final double rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  Rating copyWith({
    double? rate,
    int? count,
  }) =>
      Rating(
        rate: rate ?? this.rate,
        count: count ?? this.count,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json["rate"] as num).toDouble(),
        count: json["count"] as int,
      );

  Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
      };
}

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final Category category;
  final String image;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    Category? category,
    String? image,
    Rating? rating,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        category: category ?? this.category,
        image: image ?? this.image,
        rating: rating ?? this.rating,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] as int,
        title: json["title"] as String,
        price: (json["price"] as num).toDouble(),
        description: json["description"] as String,
        category: CategoryExtension.fromString(json["category"] as String),
        image: json["image"] as String,
        rating: Rating.fromJson(json["rating"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category.value,
        "image": image,
        "rating": rating.toJson(),
      };

  static Product fromRawJson(String str) =>
      Product.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
}
