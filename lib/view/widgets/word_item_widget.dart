import 'package:flutter/material.dart';
import '/controllers/read_data_cubit/read_data_cubit.dart';
import '/model/word_model.dart';
import '/view/screens/word_details_screen.dart';
import '/view/styles/color_manager.dart';

class WordItemWidget extends StatelessWidget {
  const WordItemWidget({super.key,required this.wordModel});
  final WordModel wordModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: ((context) => WordDetailsScreen(wordModel: wordModel)))
        ).then((value) async{
          Future.delayed(
            const Duration(seconds: 1)
          ).then((value) {
            ReadDataCubit.get(context).getWords();
          });
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: _getBoxDecoration(),
        child: Center(
          child: Text(
            wordModel.text,
            style:const TextStyle(
              color: ColorManager.white,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _getBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color(wordModel.colorCode),
  );
}