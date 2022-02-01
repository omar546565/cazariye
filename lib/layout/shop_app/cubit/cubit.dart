import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cazariye/layout/shop_app/cubit/states.dart';

import '../../../modules/shop_app/categories_screen/categories_screen.dart';
import '../../../modules/shop_app/favorites-screen/favorites-screen.dart';
import '../../../modules/shop_app/products_screen/products_screen.dart';
import '../../../modules/shop_app/settings_screen/settings_screen.dart';


class ShopCubit extends  Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());
  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0 ;

  List<Widget> bottomScreens =
      [
        ProductsScreen(),
        CategoriesScreen(),
        FavoritesScreen(),
        SettingsScreen(),
      ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
}

