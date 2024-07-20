import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/cubit/write/cubit/wirte_cubit.dart';

class ArabicEnglish extends StatelessWidget {
  final int color;
  final bool isArabic;
  const ArabicEnglish({super.key, required this.color, required this.isArabic});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _containerLang(true,context),
        SizedBox(width: 10,),
        _containerLang(false,context)
      ],
    );
  }

  InkWell _containerLang(bool isArab,BuildContext context) {
    return InkWell(
      onTap: () =>BlocProvider.of<WirteCubit>(context).updateIsArabic(isArab) ,
      child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2,color: Colors.white),
            color: isArab==isArabic?Colors.white:Color(color)
          ),
          child: Center(child: Text(isArab==true?"Ar":"En",style: TextStyle(fontWeight: FontWeight.bold,color: !isArab==isArabic?Colors.white:Color(color)),)),
        ),
    );
  }
}