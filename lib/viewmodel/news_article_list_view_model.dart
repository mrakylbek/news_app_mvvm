import 'package:flutter/material.dart';
import 'package:mvvm_news_app/models/news_article.dart';
import 'package:mvvm_news_app/services/web_service.dart';
import 'package:mvvm_news_app/viewmodel/news_article_view_model.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}

class NewsArticleListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>.empty();

  void topCountryHeadlines(String country) async{
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlinesCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void topHeadlines() async{
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}