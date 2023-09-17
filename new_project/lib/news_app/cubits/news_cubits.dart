import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/news_app/cubits/news_state.dart';
import 'package:new_project/news_app/models/article_model.dart';
import 'package:new_project/news_app/servers/news_servers.dart';

class NewsCubits extends Cubit<NewsState> {
  NewsCubits() : super(NewsInitial());

  String cityName = 'general';
  List<Articless>? articless;
  getNews() async {
    emit(NewsLoading());
    try {
      articless = await NewsServers().getNews(catrgory: cityName);
      emit(NewsSuccess());
    } on Exception catch (e) {
      emit(NewsFailure(errMessage: e.toString()));
    }
  }
}
