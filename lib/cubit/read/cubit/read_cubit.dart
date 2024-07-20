import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/core/filter.dart';
import 'package:hive_project/model/word_model.dart';
import 'package:meta/meta.dart';

part 'read_state.dart';

class ReadCubit extends Cubit<ReadState> {
  ReadCubit() : super(ReadInitial());

  final _box=Hive.box("words");
  LangugeFilter langugeFilter=LangugeFilter.AllLang;
  SortingBy sortingBy=SortingBy.Timem;
  SortType sortType=SortType.Ascening;

  void upDateLangugeFilter(LangugeFilter languge){
    langugeFilter=languge;
  }
  void upDateSortingBy(SortingBy by){
    sortingBy=by;
  }
  void upDateSortinType(SortType type){
    sortType=type;
  }

  _removeUnWantedWords(List<WordModel>words){
    if(langugeFilter==LangugeFilter.AllLang){return;}
    for (var i = 0; i < words.length; i++) {
      if ((langugeFilter==LangugeFilter.ArabicOnly &&words[i].isArabic==false) ||(langugeFilter==LangugeFilter.EnglishOnly &&words[i].isArabic==true) ) {
        words.removeAt(i);
        i--;
      }
    }
  }

  _applaySorting(List<WordModel>words){
    if(sortingBy==SortingBy.Timem){
      if (sortType==SortType.Ascening) {
        return;
      }else{
      words.reversed.toList().cast<WordModel>();
      }
    }else{
      words.sort((WordModel a,WordModel b)=>a.text.length.compareTo(b.text.length));
      //sort by lenght word
       if (sortType==SortType.Ascening) {
        return;
      }else{
      words.reversed.toList().cast<WordModel>();
      }
    }
  }

  void getWords(){
    emit(ReadLoading());
    try {
      //becaus the get retuwn dynamic value we need it WordModel
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      _removeUnWantedWords(words);
      _applaySorting(words);
      emit(ReadSuccess(words: words));

    } catch (e) {
      emit(ReadFailed(msg: "Try Agin Later"));
    }
  }
}
