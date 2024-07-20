import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_project/view/styel/colors.dart';

abstract class ThemeApp{
  static ThemeData themeData(){
    return ThemeData(
      scaffoldBackgroundColor: ColorManager.black,
      appBarTheme:const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
        color: ColorManager.black,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.black
        )
      ),
      
    );
  }
}