import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/controllers/read_data_cubit/read_data_cubit.dart';
import '/view/styles/color_manager.dart';

import '/view/widgets/arabic_or_english_widget.dart';
import '/view/widgets/colors_widget.dart';
import '/view/widgets/custom_form.dart';
import '/view/widgets/done_button.dart';

import '../../controllers/write_data_cubit/write_data_cubit.dart';
import '../../controllers/write_data_cubit/write_data_cubit_states.dart';

class AddWordDialog extends StatefulWidget {
  const AddWordDialog({super.key});
  @override
  State<AddWordDialog> createState() => _AddWordDialogState();
}

class _AddWordDialogState extends State<AddWordDialog> {
  final GlobalKey<FormState>formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child:BlocConsumer<WriteDataCubit,WriteDataCubitStates>(
        listener: (context,state){
          if(state is WriteDataCubitSuccessState){
            Navigator.pop(context);
          }
          if(state is WriteDataCubitFailedState){
            ScaffoldMessenger.of(context).showSnackBar(_getSnackBar(state.message));
          }
        },
        builder: (context,state){
          return AnimatedContainer(
            padding:const EdgeInsets.all(15),
            duration: const Duration(milliseconds: 750),
            color: Color(WriteDataCubit.get(context).colorCode),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  ArabicOrEnglishWidget(
                    colorCode: WriteDataCubit.get(context).colorCode,
                    arabicIsSelected: WriteDataCubit.get(context).isArabic,
                  ),
                   SizedBox(height: 8.h,),

                  ColorsWidget(activeColorCode: WriteDataCubit.get(context).colorCode),
                   SizedBox(height: 10.h,),

                  CustomForm(formKey: formKey, label: "New Word"),
                   SizedBox(height: 15.h,),

                  DoneButton(
                    colorCode: WriteDataCubit.get(context).colorCode, 
                    onTap: (){
                      if(formKey.currentState!.validate()){
                        WriteDataCubit.get(context).addWord();
                        ReadDataCubit.get(context).getWords();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }, 
        
        ),
      
    );
  }

  SnackBar _getSnackBar(String message) => SnackBar(content: Text(message),backgroundColor: ColorManager.red,);
}