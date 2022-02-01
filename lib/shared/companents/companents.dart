import 'package:flutter/material.dart';
import 'package:cazariye/shared/cubit/cubit.dart';


Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 10.0 ,
  double fontsize = 20.0 ,
 required Function() function,
 required String text,
}) => Container(
  width: width,

  child: MaterialButton(
    onPressed: function,
    child:  Text(
      isUpperCase ?  text.toUpperCase() : text ,
      style:  TextStyle(
        color: Colors.white,
        fontSize: fontsize,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius:BorderRadius.circular(
      radius,
    ),
    color: background,
  ),
);

Widget defaultTextButton({
  required Function() function,
  required String text,
})=>TextButton(
  onPressed:function,
  child: Text(text.toString(),
    style: TextStyle(
      fontSize: 18.0,
    ),
  ),
);

Widget defaultFormField(
    {
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String? Function(dynamic value) validate,
  Function(String value)? onFieldSubmit,
  Function(String value)? onChange,

  bool isPassword = false,
  bool isClickable = true,
  IconData? suffix,
  Function()? suffixPressed,
  Function()? onTap,

})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  validator:validate,
  enabled:isClickable,

  decoration:  InputDecoration(
    labelText: label,
    suffixIcon:suffix != null ? IconButton(
      icon: Icon(
        suffix,
      ),
      onPressed: suffixPressed,
    ): null,

    border: OutlineInputBorder(),
  ),
  onFieldSubmitted: onFieldSubmit,
  onChanged: onChange,
    onTap :onTap,

);



Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color:Colors.grey[300],
  ),
);




void navigateTo(context,widget)=> Navigator.push
  (
  context,
  MaterialPageRoute(
    builder:(context)=> widget,
    ),
  );

void navigateAndFinish(context,widget)=> Navigator.pushAndRemoveUntil
  (
  context,
  MaterialPageRoute(
    builder:(context)=> widget,
    ),
        (Route<dynamic>route) {return false;} ,
  );



//enum



