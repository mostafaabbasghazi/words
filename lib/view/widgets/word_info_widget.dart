import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/view/styles/color_manager.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({super.key,this.onPressed,required this.color,required this.isArabic,required this.text});
  final Color color;
  final String text;
  final bool isArabic;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 5),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      decoration: _getBoxDecoration(),
      child: Row(
        children: [
          _getIsArabicWidget(),
           SizedBox(width: 10.w,),
          Expanded(child: _getTextWidget()),
          if(onPressed!=null)
          IconButton(
            onPressed: onPressed, 
            icon:const Icon(Icons.delete,color: ColorManager.black,),
          )
        ],
      ),
    );
  }

  Text _getTextWidget() {
    return Text(
      text,
      style: TextStyle(
        color: ColorManager.black,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold
      ),
    );
  }

  CircleAvatar _getIsArabicWidget() {
    return CircleAvatar(
      radius: 25,
      backgroundColor: ColorManager.black,
      child: Text(
        isArabic?"ar":"en",
        style: TextStyle(
          color: color
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(20)

  );
}