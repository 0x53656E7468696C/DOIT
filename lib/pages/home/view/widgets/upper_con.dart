import 'package:doit/pages/home/view/widgets/Carousel.dart';
import 'package:doit/pages/home/view/widgets/calender.dart';
import 'package:doit/pages/home/view/widgets/todo.dart';
import 'package:flutter/material.dart';

class UpperContainer extends StatelessWidget {
  const UpperContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 222,
      child: FractionallySizedBox(
            alignment: Alignment.topLeft,
            widthFactor: 0.96 ,
             child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  
                  children: [
                    Expanded(flex: 26, child: CarouselCon()),
                    Expanded(flex: 3, child: SizedBox()),
                    Expanded(flex: 30, child: Goal()),
                    Expanded(flex: 3, child: SizedBox()),
                    Expanded(flex: 25, child: DOITCalender()),

                  ],
                ),   
                
                Divider(),
          
              ],
             ),
           ),
    );
  }
}