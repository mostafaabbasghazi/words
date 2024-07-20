import 'package:flutter/material.dart';
import 'package:hive_project/view/styel/colors.dart';
import 'package:hive_project/view/widget/addword_dialog.dart';
import 'package:hive_project/view/widget/color_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ColorWidget(colorCode:0xFFF44336 ,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>showDialog(
          builder:(context)=> AddwordDialog(),
          context:context ),
        child:const Center(child: Icon(Icons.add,color: ColorManager.black,),),),
    );
  }
}