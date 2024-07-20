import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/model/word_model.dart';
import 'package:meta/meta.dart';

part 'wirte_state.dart';

class WirteCubit extends Cubit<WirteState> {
  WirteCubit() : super(WirteInitial());

  final _box=Hive.box("words");

  String text="";
  bool isArabic=true;
  int color=0xFF3A47A3;

  void updateText(String text){
    this.text=text;
    emit(WirteInitial());
  }
    void updateIsArabic(bool isArabic){
    this.isArabic=isArabic;
    emit(WirteInitial());
  }
    void updateColor(int color){
    this.color=color;
    emit(WirteInitial());
  }
  void addWord(){
    emit(WirteLoading());
    try {
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words.add(WordModel(
        indexInDataBase: words.length, 
        text: text, 
        isArabic: isArabic, 
        colorCode: color));
      _box.put("wordsList", words);
      emit(WirteSuccess());
      

    } catch (e) {
      emit(WirteFailed(msg: "add word erorr"));
    }
  }
  void deleteWord(int index){
    emit(WirteLoading());
    try {

      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words.removeAt(index);
      for (var i = index; i < words.length; i++) {
        words[i]=words[i].decrementIndexAtDB();
      }
      _box.put("wordsList", words);
      emit(WirteSuccess());

    } catch (e) {
      emit(WirteFailed(msg: "eorr delete"));
    }
  }
  void addDescription(int index){
    emit(WirteLoading());
    try {
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words[index]=words[index].addDescription(text, isArabic);
      _box.put("wordsList", words);
      emit(WirteSuccess());
    } catch (e) {
      emit(WirteFailed(msg: "add decription erorr"));
    }
  }
  void addExmple(int index){
    emit(WirteLoading());
    try {
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words[index]=words[index].addExampel(text, isArabic);
      _box.put("wordsList", words);
      emit(WirteSuccess());
    } catch (e) {
      emit(WirteFailed(msg: "add example erorr"));
    }
  }
  void deleteExample(int indexAtDB,int index,bool isArab){
    emit(WirteLoading());
    try {
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words[indexAtDB]=words[indexAtDB].deleteExampel(index, isArabic);
      _box.put("wordsList", words);
      emit(WirteSuccess());
    } catch (e) {
      emit(WirteFailed(msg: "add example erorr"));
    }
  }
  void deleteDescription(int indexAtDB,int index,bool isArab){
    emit(WirteLoading());
    try {
      List<WordModel>words=List.from(_box.get("wordsList",defaultValue: [])).cast<WordModel>();
      words[indexAtDB]=words[indexAtDB].deleteDescription(index, isArabic);
      _box.put("wordsList", words);
      emit(WirteSuccess());
    } catch (e) {
      emit(WirteFailed(msg: "add example erorr"));
    }
  }

}
