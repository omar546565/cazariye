import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('1572A1'),
        title: Center(
          child: Text(
            'المقدمة الجزريِّة',
          ),
        ),


      ),

      body:  Column(
     children: [
       Container(
       color: HexColor('FFAFAF'),
         child: Row(
           children: [
             Expanded(
               child: Image(
                 alignment: AlignmentDirectional.bottomStart,
                 image: AssetImage('assets/images/male.jpg'),
                 height:50.0,
                 width: 50.0,
               ),
             ),
             Expanded(
               child: Center(
                 child: Text(
                   'مقدمة',
                   style: TextStyle(
                     fontSize: 25.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
             ),
             Expanded(
               child: Image(
                 alignment: AlignmentDirectional.bottomEnd,
                 image: AssetImage('assets/images/male.jpg'),
                 height:50.0,
                 width: 50.0,
               ),
             ),
           ],
         ),
       ),
     ],
    ),

    );
  }
}
