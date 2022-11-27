import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

//подключить бд
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  void dropinfo() async {
    WidgetsFlutterBinding.ensureInitialized(); //инициализация бд
    await Firebase.initializeApp();
  }

  Widget build(BuildContext context) {
    dropinfo();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(136, 136, 112, 235),
        title: const Text('Поиск'),
        actions: [
          IconButton(
              onPressed: () => {
                    showSearch(
                      context: context,
                      delegate: MySearchDelegate(),
                    )
                  },
              icon: Icon(Icons.search))
        ],
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
