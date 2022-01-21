import 'package:flutter/foundation.dart';
import 'package:news_mvvm/models/news_article.dart';
import 'package:news_mvvm/services/web_service.dart';
import 'package:news_mvvm/viewmodels/news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = [];

  void topHeadlines() async {
    List<NewsArticle> newArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    articles =
        newArticles.map((e) => NewsArticleViewModel(newsArticle: e)).toList();
    if (articles.isEmpty) {
      loadingStatus = LoadingStatus.empty;
    } else {
      loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
