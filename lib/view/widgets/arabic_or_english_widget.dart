import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/controllers/write_data_cubit/write_data_cubit.dart';
import '/view/styles/color_manager.dart';

class ArabicOrEnglishWidget extends StatelessWidget {
  const ArabicOrEnglishWidget({super.key,required this.arabicIsSelected,required this.colorCode});
  final int colorCode;
  final bool arabicIsSelected;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _getContainerDesign(true,context), 
         SizedBox(width: 5.w,),
        _getContainerDesign(false,context), 
      ],
    );
  }

  InkWell _getContainerDesign(bool buildIsArabic,BuildContext context) {
    return InkWell(
      onTap: ()=>WriteDataCubit.get(context).updateIsArabic(buildIsArabic),
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.w,color: ColorManager.white),
          color:buildIsArabic==arabicIsSelected  ?ColorManager.white  :  Color(colorCode),
        ),
        child: Center(
          child: Text(
            buildIsArabic?"ar":"en",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: !(buildIsArabic==arabicIsSelected)  ?ColorManager.white  :  Color(colorCode),
              ),
          ),
        ),
      ),
    );
  }
}