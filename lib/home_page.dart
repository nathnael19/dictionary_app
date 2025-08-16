import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
        }
      },
      icon: Icon(Icons.clear),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
    icon: Icon(Icons.arrow_back_ios),
  );

  @override
  Widget buildResults(BuildContext context) => Scaffold(
    backgroundColor: Colors.white,
    body: Center(child: Text(query)),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = ["one", "two", "three", "four"];

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestion[index]),
          onTap: () {
            query = suggestion[index];
            showResults(context);
          },
        );
      },
    );
  }
}
