import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0D1E25).withAlpha(150),
      appBar: AppBar(
        title: Text("Dicty"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xff0D1E25),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Word", style: TextStyle(color: Colors.white, fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "n. (w3:d) a single unit of language that means somthing and can be spoken or written",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See more meanings ",
                    style: TextStyle(color: Colors.lightBlue, fontSize: 15),
                  ),
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: MySearchDelegate(),
                      );
                    },
                    icon: Icon(Icons.arrow_forward, color: Colors.lightBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> suggestions = ["one", "two", "three", "four"];
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
    List<String> suggestion = suggestions.where((search) {
      final result = search.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

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
