import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/view/styles/color_manager.dart';

class UpdateWordButton extends StatelessWidget {
  const UpdateWordButton({super.key,required this.color,required this.onTap});
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 35.h,
        decoration: _getBoxDecoration(),
        child:const Icon(
          Icons.add,
          color: ColorManager.black,
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: color,
  );
}