import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_news_app/screens/news_article_detail_screen.dart';
import 'package:mvvm_news_app/viewmodel/news_article_list_view_model.dart';
import 'package:mvvm_news_app/viewmodel/news_article_view_model.dart';
import 'package:mvvm_news_app/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({required this.articles});

  void _showNewsDetailScreen(context, article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return NewsArticleDetailScreen(article: article,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsDetailScreen(context, article);
          },
          child: GridTile(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: CircleImage(
                imageUrl: article.urlToImage,
              ),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
        // Text(listViewModel.artciles[index].title);
      },
      itemCount: this.articles.length,
    );
  }
}
