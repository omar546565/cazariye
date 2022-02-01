import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('1572A1'),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: Icon(
              Icons.share,
              size: 30.0,
              color: Colors.grey[200],
            ),
          ),
        ],
        title: Center(
          child: Text(
            'إتقان',
          ),
        ),


      ),
      body:  Center(
        child: Text(
          'إتقان',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,

          ),

        ),
      ),

    );
  }
}
