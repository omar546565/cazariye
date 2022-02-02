import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cazariye/modules/shop_app/login/shop_login_screen.dart';
import 'package:cazariye/shared/companents/companents.dart';
import 'package:cazariye/shared/network/local/cache_helper.dart';

import '../../../layout/shop_app/shop_layout.dart';
import '../../../shared/styles/colors.dart';
import '../products_screen/products_screen.dart';

class BoardignModel
{
  late final String image;
  late final String title;
  late final String body;

  BoardignModel({
    required this.image,
    required this.title,
    required this.body,
  });

}




class OnBoardingScreen extends StatefulWidget
{
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
{
  var boardController = PageController();

  List<BoardignModel> boarding =
  [
    BoardignModel( image:'assets/images/onboard_1.jpg',
      title: 'مؤسسة إتقان للتعليم والتنمية',
      body: 'تقدم',),
    BoardignModel( image:'assets/images/onboard_2.jpg',
      title: 'منظومة الجزرية',
      body: 'دورات تعليمية',),
    BoardignModel( image:'assets/images/onboard_3.jpg',
      title: 'القراءة السليمة',
      body: 'ضبط القرآن',),
  ];

  bool isLast = false;
  void submit()
  {
    CacheHelper.saveData(key: 'onBoarding', value: true,).then((value) {
      if(value)
        {
          navigateAndFinish(context, ShopLayout());
        }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        TextButton(
            onPressed: ()
            {
             submit();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
        ),
      ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
                child: Container(
                child:
                PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index)
                  {
                    if(index == boarding.length - 1){
                     setState(() {
                       isLast =true;

                     });

                    }else{
                      setState(() {
                        isLast =false;

                      });

                    }
                  },
                  itemBuilder:(context,index)=>buildBoardingItem(boarding[index]),
                  itemCount: 3,
                ),

                ),
            ),
            SizedBox(height: 40.0,),
            Row(
               children: [
                SmoothPageIndicator(
                  controller: boardController,
                  effect:ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight:10.0,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                 Spacer(),
                 FloatingActionButton(onPressed: ()
                 {
                   if(isLast){
                     submit();
                   }else{
                     boardController.nextPage(
                       duration: Duration(
                         milliseconds: 750,
                       ),
                       curve: Curves.fastLinearToSlowEaseIn,
                     );
                   }

                 },
                 child: Icon(Icons.arrow_forward_ios),
                 ),
               ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardignModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 20.0,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 24.0,
        ),
      ),
      SizedBox(height: 15.0,),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(height: 15.0,),
    ],
  );
}
