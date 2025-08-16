import 'package:dictionary/cubit/dictionary_cubit.dart';
import 'package:dictionary/cubit/dictionary_state.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DictionaryCubit(DictionaryRepository()),
      child: Scaffold(
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
                Text(
                  "Word",
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
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
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> suggestions = ["one", "two", "three", "four"];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff0D1E25),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textTheme: theme.textTheme.copyWith(
        titleLarge: const TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = '';
          showSuggestions(context);
        }
      },
      icon: const Icon(Icons.clear),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
    icon: const Icon(Icons.arrow_back_ios),
  );

  @override
  Widget buildResults(BuildContext context) {
    // Call API when showing results
    context.read<DictionaryCubit>().loadMeaning(query);

    return BlocBuilder<DictionaryCubit, DictionaryState>(
      builder: (context, state) {
        if (state is DictionaryLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is DictionaryFailed) {
          return Center(
            child: Text(
              state.msg,
              style: const TextStyle(color: Colors.redAccent, fontSize: 16),
            ),
          );
        } else if (state is DictionaryLoaded) {
          final entries = state.dictionary;

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];

              return Card(
                color: const Color(0xff0D1E25),
                margin: const EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.word,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Meanings
                      ...entry.meanings.map(
                        (meaning) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meaning.partOfSpeech,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            ...meaning.definitions.map(
                              (def) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                ),
                                child: Text(
                                  "• ${def.definition}",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(
          child: Text(
            "Search for a word...",
            style: TextStyle(color: Colors.white70),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> filtered = suggestions.where((search) {
    //   final result = search.toLowerCase();
    //   final input = query.toLowerCase();
    //   return result.contains(input);
    // }).toList();

    // return ListView.builder(
    //   itemCount: filtered.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Text(
    //         filtered[index],
    //         style: const TextStyle(color: Colors.white, fontSize: 15),
    //       ),
    //       onTap: () {
    //         query = filtered[index];
    //         showResults(context);
    //       },
    //     );
    //   },
    // );
    return Container();
  }
}
