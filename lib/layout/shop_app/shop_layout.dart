import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cazariye/layout/shop_app/cubit/cubit.dart';
import 'package:cazariye/layout/shop_app/cubit/states.dart';
import 'package:cazariye/modules/shop_app/login/shop_login_screen.dart';
import 'package:cazariye/modules/shop_app/search-screen/search-screen.dart';
import 'package:cazariye/shared/companents/companents.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hexcolor/hexcolor.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
       listener:(context,state) {},
       builder: (context,state) {
         var cubit= ShopCubit.get(context);
        return Scaffold(

           body:  cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              
              index: cubit.currentIndex,
              height: 60.0,
              items: <Widget>[
                Icon(
                    Icons.info_outline,
                    color: Colors.grey[400],
                    size: 35),
                Icon(Icons.home, color: Colors.grey[400], size: 30,),
                Icon(Icons.stars_sharp, color: Colors.grey[400], size: 30,),
                Icon(Icons.library_books_outlined, color: Colors.grey[400], size: 30,),

              ],
              color: HexColor("1572A1"),
              buttonBackgroundColor: Colors.white70,
              backgroundColor: Colors.transparent,
              animationCurve: Curves.easeInOut,
              animationDuration: Duration(milliseconds: 600),
              onTap: (index) {
                cubit.changeBottom(index);
              },
              letIndexChange: (index) => true,
            ),
         );
       },
    );
  }
}
