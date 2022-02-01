import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('1572A1'),
        title: Center(
          child: Text(
            'تحفيظ',
          ),
        ),

      ),
      body:  Center(
        child: Text(
          'تحفيظ',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,

          ),

        ),
      ),

    );
  }
}
