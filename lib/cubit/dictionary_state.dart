import 'package:dictionary/model/dictionary_model.dart';

abstract class DictionaryState {}

final class DictionaryFailed extends DictionaryState {
  final String msg;

  DictionaryFailed({required this.msg});
}

final class DictionaryInitial extends DictionaryState {}

final class DictionaryLoaded extends DictionaryState {
  final List<DictionaryModel> dictionary;

  DictionaryLoaded({required this.dictionary});
}

final class DictionaryLoading extends DictionaryState {}
