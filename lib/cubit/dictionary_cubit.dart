import 'package:dictionary/cubit/dictionary_state.dart';
import 'package:dictionary/model/dictionary_model.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  DictionaryCubit() : super(DictionaryInitial());

  Future<void> loadMeaning(String word) async {
    DictionaryRepository dictionaryRepository = DictionaryRepository();
    try {
      emit(DictionaryLoading());
      List<DictionaryModel> dictionary = await dictionaryRepository.loadMeaning(
        word,
      );
      emit(DictionaryLoaded(dictionary: dictionary));
    } catch (e) {
      emit(DictionaryFailed(msg: e.toString()));
    }
  }
}
