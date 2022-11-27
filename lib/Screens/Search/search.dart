import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hackaton2/colors.dart';

//подключить бд
class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height
        child: AppBar(
          backgroundColor: mainColour.withOpacity(0.6),
          actions: [
            IconButton(
              onPressed: () => {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                )
              },
              icon: Icon(Icons.search),
              iconSize: 36,
            )
          ],
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'Гайморит',
    "ОРВИ",
    "Грипп",
    "Ангина",
    "Ринит",
  ]; //запихнуть в метод, который счтитывает

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => {
                  if (query.isEmpty) {close(context, null)} else {query = ''}
                }),
      ];

  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
        ),
      );

  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = searchResults.where((searchResults) {
      final results = searchResults.toLowerCase();
      final input = query.toLowerCase();

      return results.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        final suggestions = suggestion[index];

        return ListTile(
          title: Text(suggestions),
          onTap: () {
            query = suggestions;

            showResults(context);
          },
        );
      },
    );
  }
}
