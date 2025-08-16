import 'package:dictionary/cubit/dictionary_cubit.dart';
import 'package:dictionary/home_page.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:dictionary/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => DictionaryCubit(DictionaryRepository()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
