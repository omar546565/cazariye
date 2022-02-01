import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cazariye/layout/shop_app/shop_layout.dart';
import 'package:cazariye/modules/shop_app/login/cubit/cubit.dart';
import 'package:cazariye/modules/shop_app/login/cubit/states.dart';
import 'package:cazariye/modules/shop_app/register/shop_register_screen.dart';
import 'package:cazariye/shared/companents/companents.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';

class ShopLoginScreen extends StatelessWidget {
 
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),

      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener:(context,state){
          if(state is ShopLoginSuccessState)
          {
            if(state.loginModel.success){

              print(state.loginModel.message);
              print(state.loginModel.token);

              CacheHelper.saveData(key: 'token', value: state.loginModel.token,).then((value)
              {
                navigateAndFinish(context,
                  ShopLayout(),
                );

              },);

            }else{

            }
          }
        } ,
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key:formKey ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('LOGIN',
                          style:  Theme.of(context).textTheme.headline4,
                        ),
                        Text('login now to browes our hot offers',
                          style:  Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 30.0,),

                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'email must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15.0,),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock,
                          suffix: ShopLoginCubit.get(context).suffix ,
                          onFieldSubmit: (value){
                              if(formKey.currentState!.validate())
                              {
                              ShopLoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passwordController.text,
                                 );
                              }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: (){
                            ShopLoginCubit.get(context).changePasswordVisibility();
                          },
                          validate: (value){
                            if(value!.isEmpty){
                              return 'password must not be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0,),
                        state is ShopLoginLoadingState  ? Center(child: CircularProgressIndicator()) : defaultButton(
                          function: (){
                            if(formKey.currentState!.validate()){
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }

                          },
                          text: 'login',
                          isUpperCase: true,
                        ),



                        SizedBox(height: 20.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account',
                            ),
                            defaultTextButton(function: (){
                              navigateTo(context, ShopRegisterScreen(),);
                            },
                              text: 'register',
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
