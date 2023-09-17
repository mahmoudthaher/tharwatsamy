import 'package:dio/dio.dart';
import 'package:new_project/news_app/models/article_model.dart';

class NewsServers {
  Dio dio = Dio();

  Future<List<Articless>> getNews({String catrgory = 'general'}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=b01b29d101a84db08e1aadb31d890a7a&category=$catrgory');
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> jsonOpject = jsonData['articles'];
      List<Articless> articless = [];
      for (var json in jsonOpject) {
        articless.add(Articless.fromJson(json));
      }
      return articless;
    } catch (e) {
      return [];
    }
  }
}
