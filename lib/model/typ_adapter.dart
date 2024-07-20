import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/model/word_model.dart';

class WordTypeAdapter extends TypeAdapter<WordModel>{
  @override
  read(BinaryReader reader) {
    return WordModel(
      indexInDataBase: reader.readInt(),
       text: reader.readString(), 
       isArabic: reader.readBool(), 
       colorCode: reader.readInt(),
       arabicDescription: reader.readStringList(),
       arabicExampl: reader.readStringList(),
       englishDescription: reader.readStringList(),
       englishExampl: reader.readStringList()
       );
  }

  @override
  // TODO: implement typeId
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, obj) {
   writer.writeInt(obj.indexInDataBase);
   writer.writeString(obj.text);
   writer.writeInt(obj.colorCode);
   writer.writeStringList(obj.arabicDescription);
   writer.writeStringList(obj.arabicExampl);
   writer.writeStringList(obj.englishDescription);
   writer.writeStringList(obj.englishExampl);
  }

}