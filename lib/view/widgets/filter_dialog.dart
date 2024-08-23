import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/controllers/read_data_cubit/read_data_cubit.dart';
import '/controllers/read_data_cubit/read_data_cubit_states.dart';
import '/view/styles/color_manager.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ReadDataCubit,ReadDataCubitStates>(
      builder: (context, state) {
        return Dialog(
          backgroundColor: ColorManager.black,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _getLabelText("Language"),
                 SizedBox(height: 10.h,),
                _getLanguageFilter(context),
                 SizedBox(height: 15.h,),
                _getLabelText("Sorted By"),
                 SizedBox(height: 10.h,),
                _getSortedByFilter(context),
                 SizedBox(height: 15.h,),
                _getLabelText("Sorting Type"),
                 SizedBox(height: 10.h,),
                _getSortingTypeFilter(context),
                
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _getSortedByFilter(BuildContext context){
    return _getFilterField(
      labels: ["Time","Word Length"], 
      onTaps: [
        ()=>ReadDataCubit.get(context).updateSortedBy(SortedBy.time),
        ()=>ReadDataCubit.get(context).updateSortedBy(SortedBy.wordLength),
      ], 
      conditionsOfActivation:[
        ReadDataCubit.get(context).sortedBy==SortedBy.time,
        ReadDataCubit.get(context).sortedBy==SortedBy.wordLength,
      ],
    );
  }

  Widget _getSortingTypeFilter(BuildContext context){
    return _getFilterField(
      labels: ["Ascending","Descending"], 
      onTaps: [
        ()=>ReadDataCubit.get(context).updateSortingType(SortingType.ascending),
        ()=>ReadDataCubit.get(context).updateSortingType(SortingType.descending),
      ], 
      conditionsOfActivation: [
        ReadDataCubit.get(context).sortingType==SortingType.ascending,
        ReadDataCubit.get(context).sortingType==SortingType.descending,
      ],
      );
  }

  Widget _getLanguageFilter(BuildContext context) {
    return _getFilterField(
      labels: ["Arabic","English","All"], 
      onTaps: [
        ()=>ReadDataCubit.get(context).updateLanguageFilter(LanguageFilter.arabicOnly),
        ()=>ReadDataCubit.get(context).updateLanguageFilter(LanguageFilter.englishOnly),
        ()=>ReadDataCubit.get(context).updateLanguageFilter(LanguageFilter.allWords),
      ], 
      conditionsOfActivation: [
        ReadDataCubit.get(context).languageFilter==LanguageFilter.arabicOnly,
        ReadDataCubit.get(context).languageFilter==LanguageFilter.englishOnly,
        ReadDataCubit.get(context).languageFilter==LanguageFilter.allWords,
      ],
    );
  }

  Widget _getFilterField({
    required List<String>labels,
    required List<VoidCallback>onTaps,
    required List<bool>conditionsOfActivation,
  }){
    return Row(
      children: [
        for(int i=0;i<labels.length;i++)
        InkWell(
          onTap: onTaps[i],
          child: Container(
            height: 40.h,
            padding:const EdgeInsets.all(10),
            margin:const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: ColorManager.white),
              color: conditionsOfActivation[i]?ColorManager.white:ColorManager.black,
            ),
            child: Center(
              child: Text(
                labels[i],
                style: TextStyle(
                  color: conditionsOfActivation[i]?ColorManager.black:ColorManager.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getLabelText(String text){
    return Text(
      text,
      style: TextStyle(
        color: ColorManager.white,
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),
    );
  }

}