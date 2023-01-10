import 'package:dio/dio.dart';
import 'package:mvvm_news_app/models/news_article.dart';
import 'package:mvvm_news_app/utils/constants.dart';

class WebService{
  var dio = Dio();

  Future<List<NewsArticle>> fetchTopHeadlinesCountry(String country) async{

    final response = await dio.get(Constants.headlinesFor(country));

    if(response.statusCode == 200){
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news!!!!");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=40f12d49c2f84017bd3a0bf92c6e2135';
    // String url = 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';

    final response = await dio.get(Constants.TOP_HEADLINE_URL);

    if(response.statusCode == 200){
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news!!!!");
    }
  }
}