class Articless {
  final String? description;
  final String? image;
  final String title;

  const Articless(
      {required this.image, required this.title, required this.description});

  factory Articless.fromJson(json) {
    return Articless(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
    );
  }
}
