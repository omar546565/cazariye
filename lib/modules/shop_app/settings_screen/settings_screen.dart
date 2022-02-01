import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('1572A1'),
        title: Center(
          child: Text(
            'شرح المنظومة',
          ),
        ),

      ),
      body:  Center(
        child: Text(
          'شرح المنظومة',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,

          ),

        ),
      ),

    );
  }
}
