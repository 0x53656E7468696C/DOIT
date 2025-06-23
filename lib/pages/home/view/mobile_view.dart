import 'package:doit/pages/home/view/widgets/bottom_bar.dart';
import 'package:doit/pages/home/view/widgets/frosted.dart';
import 'package:doit/pages/home/view/widgets/nav.dart';
import 'package:doit/pages/home/view/widgets/responsive.dart';
import 'package:doit/pages/home/view/widgets/time_log.dart';
import 'package:flutter/material.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Padding(
        padding:  EdgeInsets.only( top : 8.0),
        child: Column(
          children: [ 
            DOITNav(),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                DOITTimeLog(),
                FrostedGlass(),
                DOITBottomNavBar(),  
                DOITDateScroll(),
              
                ],
                
              ),
            ),
                          
          ],
        ),
      ),
    );
  }
}