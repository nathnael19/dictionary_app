import 'package:dictionary/cubit/dictionary_state.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final DictionaryRepository dictionaryRepository;

  DictionaryCubit(this.dictionaryRepository) : super(DictionaryInitial());

  Future<void> loadMeaning(String word) async {
    try {
      emit(DictionaryLoading());
      final dictionary = await dictionaryRepository.loadMeaning(word);
      emit(DictionaryLoaded(dictionary: dictionary));
    } catch (e) {
      emit(DictionaryFailed(msg: "misspaled!!"));
    }
  }
}
