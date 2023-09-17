abstract class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

final class NewsSuccess extends NewsState {}

final class NewsFailure extends NewsState {
  final String errMessage;
  NewsFailure({required this.errMessage});
}
