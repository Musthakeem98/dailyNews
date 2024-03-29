import 'package:flutter/material.dart';
import 'package:news/helper/country_headlines.dart';
import '../helper/custom_search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.defaultContryCode});

  final String defaultContryCode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65,
        backgroundColor: const Color.fromRGBO(14, 31, 66, 1.0),
        title: const Text(
          'Daily News',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        scrolledUnderElevation: 5.0,
        shadowColor: const Color.fromRGBO(14, 31, 66, 1.0),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              alignment: Alignment.centerRight,
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search_rounded),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          setState(() {});
        },
        color: Color.fromRGBO(14, 31, 66, 1.0),
        displacement: 20,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        child: CountryHeadlines(countryCode: widget.defaultContryCode),
      ),
    );
  }
}
