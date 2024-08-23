
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../controllers/read_data_cubit/read_data_cubit.dart';
import '../widgets/searchField.dart';
import '/view/styles/color_manager.dart';
import '/view/widgets/add_word_dialog.dart';
import '/view/widgets/filter_dialog_button.dart';
import '/view/widgets/language_filter_widget.dart';
import '/view/widgets/words_widget.dart';

TextEditingController searchController=TextEditingController();

class HomeScreen extends StatefulWidget {
HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: _getFloationActionButton(context),
      appBar: AppBar(
        title: ReadDataCubit.get(context).isLoad?textField(context):Text("Azoo",style: TextStyle(fontSize: 25.sp),),
        actions: appBarItems(context),
      ),
      body: Padding(
        padding:const  EdgeInsets.all(10),
        child:  Column(
          children: [
           const Row(
              children: [
                LanguageFilterWidget(),
                Spacer(),
                FilterDialogButton(),
              ],
            ),
            SizedBox(height: 10.h,),
           
           const Expanded(
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
List<Widget> appBarItems(BuildContext context){
    if(ReadDataCubit.get(context).isLoad){
      return [
      IconButton(onPressed: (){
        clearController();
        Navigator.pop(context);
      },icon: Icon(Icons.clear,color: Colors.grey,),)
    ];
    }else{
      return [
      IconButton(onPressed:(){ goToSearch(context);},icon: Icon(Icons.search,color: Colors.grey,),)
    ];
    }
  }
  Widget textField(BuildContext context){
    return TextField(
      
      controller: searchController,
      cursorColor: Colors.black,
    decoration: InputDecoration(
      border: InputBorder.none,
      
      fillColor:Colors.white,
      hintText: "Search",
      hintStyle: TextStyle(color: const Color.fromARGB(255, 233, 230, 230),fontSize: 22.sp)
    ),
    style: TextStyle(color:Colors.black,fontSize: 23.sp) ,
    onChanged: (value){
      ReadDataCubit.get(context).updateSearchVal(value);
    },
    );
  }
  void goToSearch(BuildContext context){
    ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove:(){backFromSearch(context);} ));
    
     ReadDataCubit.get(context).updateIsLoad(true);
  
  }
  void backFromSearch(BuildContext context){
    clearController();
    ReadDataCubit.get(context).updateIsLoad(false);
   
  }
  void clearController(){
      searchController.clear();
  }