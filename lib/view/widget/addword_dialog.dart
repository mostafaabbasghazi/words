import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_project/cubit/write/cubit/wirte_cubit.dart';
import 'package:hive_project/view/widget/arabic_english.dart';
import 'package:hive_project/view/widget/color_widget.dart';
import 'package:hive_project/view/widget/cusstom_form.dart';
import 'package:hive_project/view/widget/done_button.dart';

class AddwordDialog extends StatelessWidget {
  AddwordDialog({super.key});
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<WirteCubit,WirteState>(
        builder:(context,state){
          return AnimatedContainer(
            padding: const EdgeInsets.all(20),
            duration: const Duration(milliseconds: 750),
            color: Color(BlocProvider.of<WirteCubit>(context).color),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ArabicEnglish(color: BlocProvider.of<WirteCubit>(context).color, isArabic: BlocProvider.of<WirteCubit>(context).isArabic),
                  const SizedBox(height: 10,),
                  ColorWidget(colorCode: BlocProvider.of<WirteCubit>(context).color),
                  const SizedBox(height: 10,),
                  CusstomForm(label: "Enter Word", globalKey: globalKey),
                  const SizedBox(height: 10,),
                  DoneButton(color:BlocProvider.of<WirteCubit>(context).color , onPressed: (){})
                ],
              ),
            ),
          );
        } ,),
    );
  }
}