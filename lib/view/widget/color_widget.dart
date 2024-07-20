import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/cubit/write/cubit/wirte_cubit.dart';
import 'package:hive_project/view/styel/colors.dart';

// ignore: must_be_immutable
class ColorWidget extends StatelessWidget {
  final int colorCode;
  
  ColorWidget({super.key, required this.colorCode});

  List<int> colors=[
   0xFFF44336,
   0xff666654,
   0xff090909,
   0xff264422,
   0xff298087,
   0xff275678,
   0xff456544,
   0xff989765,
   0xff565432
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        physics:const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (contxt,i){
          return InkWell(
            onTap: () => BlocProvider.of<WirteCubit>(contxt).updateColor(colors[i]),
            child: Container(
              height: 50,
              width:50,
              decoration: BoxDecoration(
                shape:BoxShape.circle,
                border:colorCode==colors[i]? Border.all(color: Colors.white,width: 2):null,
                color: Color(colors[i])
              ),
              child: colorCode==colors[i]?const Center(
                child: Icon(Icons.done,color: ColorManager.white,)
              ):null
            ),
          );
        }, 
        separatorBuilder: (context,i)=>SizedBox(width: 10,), 
        itemCount: colors.length),
    );
  }
}