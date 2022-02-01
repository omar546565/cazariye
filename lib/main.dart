import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:cazariye/layout/shop_app/cubit/cubit.dart';
import 'package:cazariye/layout/shop_app/shop_layout.dart';
import 'package:cazariye/modules/shop_app/login/shop_login_screen.dart';
import 'package:cazariye/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:cazariye/shared/bloc_observer.dart';
import 'package:cazariye/shared/cubit/states.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';
import 'package:cazariye/shared/network/remote/dio_helper.dart';
import 'package:cazariye/shared/styles/themes.dart';
import 'shared/cubit/cubit.dart';



void main() async {

   WidgetsFlutterBinding.ensureInitialized();
   //بيتأكد أن كل حاجة هنا في الميثود خلصت وبعدين بفتح الابلكيشن

  BlocOverrides.runZoned(
        () {
      // Use cubits...

    },
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();
 await  CacheHelper.init();

 bool? isDark = CacheHelper.getData(key: 'isDark');

 Widget widget;

 bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
 String? token = CacheHelper.getData(key: 'token');

 if(onBoarding != null){
   if(token != null) widget = ShopLayout();
   else widget = ShopLayout();
 }else{
   widget = OnBoardingScreen();
 }

  runApp( MyApp(
      isDark: isDark,
    startWidget: widget,
  ));

}

class MyApp  extends StatelessWidget
{
  late final bool? isDark;
  late final Widget? startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });

    @override
    Widget build(BuildContext context) 
    {
      // ignore: prefer_const_constructors
      return MultiBlocProvider(
        providers:
        [

          BlocProvider(  create: (BuildContext context) => AppCubit()..changeAppMode(
               fromShared: isDark,
                        ),
          ),
          BlocProvider(  create: (BuildContext context) => ShopCubit()
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
           listener: (context , state) {},
           builder: (context, state) {
          return   MaterialApp(
             debugShowCheckedModeBanner: false,
             theme:LightTheme ,
             darkTheme:DarkTheme,
             themeMode: AppCubit.get(context).isDark ? ThemeMode.dark :  ThemeMode.light ,
             home: Directionality(
             textDirection: TextDirection.rtl,
             child: startWidget!,
             ),
             );
           },
        ),
      ) ;
    }
}