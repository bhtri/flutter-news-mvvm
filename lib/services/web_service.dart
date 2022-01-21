import 'package:dio/dio.dart';
import 'package:news_mvvm/models/news_article.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=jp&apiKey=97604a4cfe784fc7a9ae242ac28b2c87';

    final Response response = await Dio().get(url);

    switch (response.statusCode) {
      case 200:
        final result = response.data;
        Iterable list = result['articles'];
        return list.map((e) => NewsArticle.fromJson(e)).toList();
      default:
        throw Exception('Failed to get top news');
    }
  }
}
