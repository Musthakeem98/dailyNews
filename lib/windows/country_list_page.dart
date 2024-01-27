import 'package:flutter/material.dart';
import 'package:news/helper/country_headlines.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Country Headlines',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          centerTitle: true,
          toolbarHeight: 65,
          elevation: 0,
          backgroundColor: Color.fromRGBO(14, 31, 66, 1.0),
        ),
        body: Column(
          children: [
            TabBar(
              isScrollable: true,
              indicatorColor: Color.fromRGBO(14, 31, 66, 1.0),
              padding: EdgeInsets.only(top: 4),
              labelColor: Color.fromRGBO(14, 31, 66, 1.0),
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              tabs: [
                Tab(
                  child: Text('India'),
                ),
                Tab(
                  child: Text('England'),
                ),
                Tab(
                  child: Text('China'),
                ),
                Tab(
                  child: Text('Canada'),
                ),
                Tab(
                  child: Text('Japan'),
                ),
                Tab(
                  child: Text('France'),
                ),
                Tab(
                  child: Text('Russia'),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CountryHeadlines(countryCode: 'in'),
                  CountryHeadlines(countryCode: 'gb'),
                  CountryHeadlines(countryCode: 'cn'),
                  CountryHeadlines(countryCode: 'ca'),
                  CountryHeadlines(countryCode: 'jp'),
                  CountryHeadlines(countryCode: 'fr'),
                  CountryHeadlines(countryCode: 'ru'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
