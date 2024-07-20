class WordModel{
  final int indexInDataBase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicDescription;
  final List<String> englishDescription;
  final List<String> arabicExampl;
  final List<String> englishExampl;
  const WordModel({
  required this.indexInDataBase,
  required this.text,
  required this.isArabic,
  required this.colorCode, 
  this.arabicDescription=const[],
  this.englishDescription=const[],
  this.arabicExampl=const[], 
  this.englishExampl=const[]});

  List<String>_listOfNewValue(bool isArab){
        if(isArab){
          return  List.from(arabicDescription);
        }else{
          return  List.from(englishDescription);
    }
  }
  WordModel _objectAfterEdit(bool isArab,List<String> newDescription){
     return WordModel(
      indexInDataBase: indexInDataBase, 
      text: text, 
      isArabic: isArabic, 
      colorCode: colorCode,
      arabicExampl: arabicExampl,
      englishExampl: englishExampl,
      arabicDescription: isArab?newDescription:arabicDescription,
      englishDescription: !isArab?newDescription:englishDescription
      );
  }

  _newListValue(bool isArab){
    if (isArab) {
      return List.from(arabicExampl);
    }else{
      return List.from(englishExampl);
    }
  }

  WordModel _objectAfterEdit2(List<String> exemple,bool isArab){
    return WordModel(indexInDataBase: indexInDataBase, 
    text: text, 
    isArabic: isArabic, 
    colorCode: colorCode,
    arabicExampl:isArab?exemple: arabicExampl,
    englishExampl:!isArab?exemple: englishExampl,
    arabicDescription: arabicDescription,
    englishDescription: englishDescription
    );
  }



  WordModel deleteDescription(int index,bool isArab){
    List<String>newDescription=_listOfNewValue(isArab);

    newDescription.removeAt(index);
    return  _objectAfterEdit(isArab, newDescription);
  }

  WordModel addDescription(String desc,bool isArab){
    List<String>newDescription=_listOfNewValue(isArab);
   
    newDescription.add(desc);
    return _objectAfterEdit(isArab, newDescription);
  }


  WordModel addExampel(String desc,bool isArab){
    List<String>newExample=_newListValue(isArab);
    newExample.add(desc);
    return _objectAfterEdit2(newExample, isArab);
  }
  WordModel deleteExampel(int index,bool isArab){
    List<String>newExample=_newListValue(isArab);
    newExample.removeAt(index);
    return _objectAfterEdit2(newExample, isArab);
  }

  WordModel decrementIndexAtDB(){
    return WordModel(
    indexInDataBase: indexInDataBase-1, 
    text: text, 
    isArabic: isArabic, 
    colorCode: colorCode,
    arabicDescription: arabicDescription,
    arabicExampl: arabicExampl,
    englishDescription: englishDescription,
    englishExampl: englishExampl
    );
  }
}