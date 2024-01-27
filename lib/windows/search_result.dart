import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../helper/blog_tile.dart';
import '../model/acticle.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.searchTerm});

  final String searchTerm;

  @override
  Widget build(BuildContext context) {

    // API calling
    List<Article> news = [];

    Future getNews(search) async {
      news.clear();

      var response = await http.get(
        Uri.parse("https://newsapi.org/v2/everything?q=$search&apiKey=caaa65154d6c409d8d5d64c16c45df67"),
      );
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        for (var element in jsonData['articles']) {
          if (element['title'] != null && element['urlToImage'] != null) {
            final articleModel = Article(
              name: element['source']['name'] ?? 'name',
              title: element['title'] ?? 'title',
              url: element['url'] ?? 'url',
              urlToImage: element['urlToImage'] ?? 'image',
              publishedAt: element['publishedAt'] ?? 'time',
            );
            news.add(articleModel);
          }
        }
      }
    }

    return FutureBuilder(
            future: getNews(searchTerm),
            builder: (context, snapshot) {
              //snapshot use to check current request call status
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    // return blog
                    return BlogTile(
                      blogName: news[index].name,
                      blogTitle: news[index].title,
                      blogUrl: news[index].url,
                      blogUrlToImage: news[index].urlToImage,
                      blogPublishedAt: news[index].publishedAt,
                    );
                  },
                );
              }

              // if still loading then show progress indicator
              else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(239, 83, 80, 1),
                  ),
                );
              }
            });
  }
}