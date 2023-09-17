import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_project/news_app/models/article_model.dart';
import 'package:new_project/news_app/servers/news_servers.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  List<Articless>? articless;

  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      String cityName = 'general';

      if (event is GetNews) {
        emit(NewsLoading());
        try {
          articless = await NewsServers().getNews(catrgory: cityName);
          emit(NewsSuccess());
        } on Exception catch (e) {
          emit(NewsFailure(errMessage: e.toString()));
        }
      }
    });
  }
}
