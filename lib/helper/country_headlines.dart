import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/acticle.dart';
import 'blog_tile.dart';
class CountryHeadlines extends StatefulWidget {
  const CountryHeadlines({Key? key, required this.countryCode}) : super(key: key);

  final String countryCode;

  @override
  _CountryHeadlinesState createState() => _CountryHeadlinesState();
}

class _CountryHeadlinesState extends State<CountryHeadlines> {
  late List<Article> news;

  @override
  void initState() {
    super.initState();
    news = [];
    // Call the method to get country headlines only once in initState
    getCountryHeadlines();
  }

  Future<void> getCountryHeadlines() async {
    try {
      var response = await http.get(
        Uri.parse("https://newsapi.org/v2/top-headlines?country=${widget.countryCode}&apiKey=caaa65154d6c409d8d5d64c16c45df67"),
      );
      var jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        List<Article> articles = [];
        for (var element in jsonData['articles']) {
          if (element['urlToImage'] != null && element['title'] != null) {
            final articleModel = Article(
              name: element['source']['name'] ?? 'name',
              title: element['title'] ?? 'title',
              url: element['url'],
              urlToImage: element['urlToImage'] ?? 'image',
              publishedAt: element['publishedAt'] ?? 'time',
            );
            articles.add(articleModel);
          }
        }
        // Update the state with the fetched articles
        setState(() {
          news = articles;
        });
      } else {
        // Handle API response error
        print("API Error: ${jsonData['message']}");
      }
    } catch (error) {
      // Handle general error
      print("Error fetching country headlines: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: news.isEmpty
          ? const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(239, 83, 80, 1),
        ),
      )
          : ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return BlogTile(
            blogName: news[index].name,
            blogTitle: news[index].title,
            blogUrl: news[index].url,
            blogUrlToImage: news[index].urlToImage,
            blogPublishedAt: news[index].publishedAt,
          );
        },
      ),
    );
  }
}
