import 'package:doit/pages/home/view/widgets/nav.dart';
import 'package:doit/pages/home/view/widgets/responsive.dart';
import 'package:doit/pages/home/view/widgets/title.dart';
import 'package:doit/pages/home/view/widgets/upper_con.dart';
import 'package:flutter/material.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("widget rebuilds again on Deskview home");
    return  Padding(padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
     child: Column(
       children: [
          DOITTitleBar.titleBar,
         const Divider(),
         ConstrainedBox(
            constraints: const BoxConstraints(
            maxWidth: 1453
          ) ,
          child: const DOITNav()
          ),
         ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 1350
          ) ,
           child: Stack(
             children: [
               const UpperContainer(),
               
                      
                       const Expanded(flex: 40, child: 
                 Column(
                children: [
               
                ],
               )
               ),
             ],
           ),
         ),
         const Responsive()
       ],
     ),);
  }
}
