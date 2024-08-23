import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/controllers/read_data_cubit/read_data_cubit_states.dart';
import '/hive_constants.dart';
import '/model/word_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReadDataCubit extends Cubit<ReadDataCubitStates>{
  
  static ReadDataCubit get(context)=>BlocProvider.of(context);
  
  ReadDataCubit():super(ReadDataCubitInitialState());

  final Box _box=Hive.box(HiveConstants.wordsBox);
  
  bool isLoad=false;
  bool isSearch=false;
  String searchVal="";

  TextEditingController searchController=TextEditingController();
  
  LanguageFilter languageFilter=LanguageFilter.allWords;
  SortedBy sortedBy=SortedBy.time;
  SortingType sortingType =SortingType.descending;

 
 void updateSearchVal(String search){
    this.searchVal=search;
    getWords();
  }
  void updateLanguageFilter(LanguageFilter languageFilter){
    this.languageFilter=languageFilter;
    getWords();
  }

  void updateSortedBy(SortedBy sortedBy){
    this.sortedBy=sortedBy;
    getWords();
  }

  void updateSortingType(SortingType sortingType){
    this.sortingType=sortingType;
    getWords();
  }
   void updateIsLoad(bool isload){
    this.isLoad=isload;

  }

  void getWords()async{
    emit(ReadDataCubitLoadingState());
    try {
      List<WordModel>wordsToReturn=List.from(_box.get(HiveConstants.wordsList,defaultValue: [])).cast<WordModel>();
      _removeUnwantedWords(wordsToReturn);
      _applySorting(wordsToReturn);
      if(searchVal==""){
        emit(ReadDataCubitSuccessState(words: wordsToReturn));
      }else{
        List<WordModel>searchItems=[];
        wordsToReturn.forEach((action){
          if(action.text.contains(searchVal)){
            searchItems.add(action);
          }
        });
        
        emit(ReadDataCubitSuccessState(words: searchItems));
      
      }
      
    } catch (error) {
      emit(ReadDataCubitFailedState(message: "We have problems at get, Please try again"));
    }
  }
  onChangeFunction(String value){
   
  }

  void _removeUnwantedWords(List<WordModel>wordsToReturn){
    if(languageFilter==LanguageFilter.allWords){
      return;
    }
    for (var i = 0; i < wordsToReturn.length; i++) {
      if(  (languageFilter==LanguageFilter.arabicOnly && wordsToReturn[i].isArabic==false  ) || (languageFilter==LanguageFilter.englishOnly && wordsToReturn[i].isArabic==true)  ){
        wordsToReturn.removeAt(i);
        i--;
      }
    }
  }

  void _applySorting(List<WordModel>wordsToReturn){
    if(sortedBy==SortedBy.time){
      if(sortingType==SortingType.ascending){
        return ;
      }
      wordsToReturn=wordsToReturn.reversed.toList();
    }else{
      wordsToReturn.sort((WordModel a,WordModel b)=>a.text.length.compareTo(b.text.length));
      if(sortingType==SortingType.ascending){
        return;
      }
      wordsToReturn=wordsToReturn.reversed.toList();
    }
  }

  void _reverse(List<WordModel>wordsToReturn){
    for (var i = 0; i < wordsToReturn.length/2; i++) {
      WordModel temp=wordsToReturn[i];
      wordsToReturn[i]=wordsToReturn[wordsToReturn.length-1-i];
      wordsToReturn[wordsToReturn.length-1-i]=temp;
    }
  }

}

enum LanguageFilter{
  arabicOnly,
  englishOnly,
  allWords,
}

enum SortedBy{
  time,
  wordLength,
}

enum SortingType{
  ascending,
  descending,
}



