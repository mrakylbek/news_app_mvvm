import 'package:intl/intl.dart';

import '../models/news_article.dart';

class NewsArticleViewModel{
  NewsArticle _newsArticle;

  NewsArticleViewModel({required NewsArticle article}) : _newsArticle = article;

  String get title{
    return _newsArticle.title;
}
  String get author{
    return _newsArticle.author;
}
  String get description{
    return _newsArticle.description;
}
  String get urlToImage{
    return _newsArticle.urlToImage;
}
  String get url{
    return _newsArticle.url;
}
  String get publishedAt{
    final dateTime = DateFormat('yyyy-mm-ddTHH:mm:ssZ').parse(_newsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
}

}