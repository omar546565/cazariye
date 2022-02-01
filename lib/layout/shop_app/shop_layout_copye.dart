import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cazariye/layout/shop_app/cubit/cubit.dart';
import 'package:cazariye/layout/shop_app/cubit/states.dart';
import 'package:cazariye/modules/shop_app/login/shop_login_screen.dart';
import 'package:cazariye/modules/shop_app/search-screen/search-screen.dart';
import 'package:cazariye/shared/companents/companents.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
       listener:(context,state) {},
       builder: (context,state) {
         var cubit= ShopCubit.get(context);
        return Scaffold(
           appBar: AppBar(
             title: Text(
               'Salla',
             ),
             actions: [
               IconButton(
                 onPressed: (){
                   navigateTo(context, SearchScreen(),);
                 },
                 icon: Icon(
                 Icons.search,
               ),
               ),
             ],
           ),
           body:  cubit.bottomScreens[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             onTap: (index){
               cubit.changeBottom(index);
             },
             currentIndex: cubit.currentIndex,
             items: [
               BottomNavigationBarItem(
                 icon: Icon(
                 Icons.home,
               ),
                 label: 'Home',
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                 Icons.apps,
               ),
                 label: 'Categories',
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                 Icons.favorite,
               ),
                 label: 'Favorites',
               ),
               BottomNavigationBarItem(
                 icon: Icon(
                 Icons.settings,
               ),
                 label: 'Settings',
               ),
             ],
           ),
         );
       },
    );
  }
}
