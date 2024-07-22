import 'package:flutter/material.dart';
import '/view/styles/color_manager.dart';
import '/view/widgets/add_word_dialog.dart';
import '/view/widgets/filter_dialog_button.dart';
import '/view/widgets/language_filter_widget.dart';
import '/view/widgets/words_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _getFloationActionButton(context),
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body:const Padding(
        padding:  EdgeInsets.all(10),
        child:  Column(
          children: [
            Row(
              children: [
                LanguageFilterWidget(),
                Spacer(),
                FilterDialogButton(),
              ],
            ),
            SizedBox(height: 10,),
            Expanded(
              child: WordsWidget(),
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _getFloationActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.white,
      onPressed: () => showDialog(
        context: context,
        builder: (context) =>const AddWordDialog(), 
      ),
      child:const Icon(Icons.add,color: ColorManager.black,),
    );
  }
}