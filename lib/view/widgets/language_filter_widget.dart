import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/controllers/read_data_cubit/read_data_cubit.dart';
import '/controllers/read_data_cubit/read_data_cubit_states.dart';
import '/view/styles/color_manager.dart';

class LanguageFilterWidget extends StatelessWidget {
  const LanguageFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadDataCubit,ReadDataCubitStates>(
      builder: (context, state) {
        return Text(
          _mapLanguageFilterEnumToString(ReadDataCubit.get(context).languageFilter),
          style:  TextStyle(
            color: ColorManager.white,
            fontSize: 21.sp,
            fontWeight: FontWeight.bold
          ),
        );
      },
    );
  }

  String _mapLanguageFilterEnumToString(LanguageFilter languageFilter){
    if(languageFilter==LanguageFilter.allWords){
      return "All Words";
    }else if(languageFilter==LanguageFilter.englishOnly){
      return "English Only";
    }else{
      return "Arabic Only";
    }
  }
}