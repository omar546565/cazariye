import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cazariye/shared/cubit/states.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';




class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;
   bool isBottomSheetShown =false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
  required bool isShow,
  required IconData icon,


})
  {
    isBottomSheetShown= isShow;
    fabIcon = icon;
    
    emit(AppChangeBottomSheetState());
  }

  bool isDark = true;


  void changeAppMode({bool? fromShared})
  {
    if(fromShared != null){
      isDark = fromShared;
      emit(AppChangeModeState());
    }

    else
      {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value:isDark ).then((value)
      {
      emit(AppChangeModeState());
      });
      }


  }

}