class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(json) => RatingModel(
        rate: json['rate'],
        count: json['count'],
      );
}
