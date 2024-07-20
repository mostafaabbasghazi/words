import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/cubit/write/cubit/wirte_cubit.dart';

// ignore: must_be_immutable
class CusstomForm extends StatelessWidget {
  final String label;
  final GlobalKey<FormState>globalKey;
  TextEditingController controller=TextEditingController();
  CusstomForm({super.key, required this.label, required this.globalKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: TextFormField(
        autofocus: true,
        onChanged:(value) => BlocProvider.of<WirteCubit>(context).updateText(controller.text),
        controller: controller,
        minLines: 1,
        maxLength: 3,
        cursorColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          label: Text(label,style: const TextStyle(color: Colors.white),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.red)
          ),
        ),
        validator: (value){
          bool isArab=BlocProvider.of<WirteCubit>(context).isArabic;
          if (value==null && value!.length==0) {
            return "empty value";
            
          }
          for (var i = 0; i < value.length; i++) {
            CharType charType=_charType(value.codeUnitAt(i));
            if (charType==CharType.notValid) {
              return " char number ${i+1} is not valid";
            }else if(charType==CharType.arabic && isArab==false){
              return " char number ${i+1} is not english";
            }else if(charType==CharType.english && isArab==true){
              return " char number ${i+1} is not arabic";
            }
          }
          return null;
        },
      ),
    );
  }
}
CharType _charType(int asciCode ){
  if ((asciCode>=65 && asciCode<=90)&&(asciCode>=97 && asciCode<=122) ) {
    return CharType.english;
  }else if(asciCode>=1569 &&asciCode<=1610){
    return CharType.arabic;
  }else if(asciCode==32){
    return CharType.space;
  }  
  return CharType.notValid;
}
enum CharType{
  notValid,
  arabic,
  english,
  space
}