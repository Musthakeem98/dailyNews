import 'package:flutter/material.dart';
import 'package:news/helper/category.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({super.key});

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Category',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          toolbarHeight: 65,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Color.fromRGBO(14, 31, 66, 1.0),
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Color.fromRGBO(14, 31, 66, 1.0),
              padding: EdgeInsets.only(top: 4),
              unselectedLabelColor: Colors.black,
              labelColor: Color.fromRGBO(14, 31, 66, 1.0),
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              tabs: [
                Tab(child: Text('Science')),
                Tab(child: Text('Business')),
                Tab(child: Text('Technology')),
                Tab(child: Text('Sports')),
                Tab(child: Text('Health')),
                Tab(child: Text('Entertainment')),
                Tab(child: Text('General')),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CategoryNews(category: 'science'),
                  CategoryNews(category: 'Business'),
                  CategoryNews(category: 'Technology'),
                  CategoryNews(category: 'Sports'),
                  CategoryNews(category: 'Health'),
                  CategoryNews(category: 'Entertainment'),
                  CategoryNews(category: 'General'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
