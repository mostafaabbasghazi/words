import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_project/cubit/read/cubit/read_cubit.dart';
import 'package:hive_project/cubit/write/cubit/wirte_cubit.dart';
import 'package:hive_project/model/typ_adapter.dart';
import 'package:hive_project/view/screens/home.dart';
import 'package:hive_project/view/styel/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordTypeAdapter());
  await Hive.openBox("words");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>WirteCubit() ),
        BlocProvider(create:(context)=>ReadCubit() )
      ], 
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeApp.themeData(),
      home:const Home()
    ));
  }
}

