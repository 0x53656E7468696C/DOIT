import 'dart:ui';

import 'package:doit/pages/home/view/widgets/goal.dart';
import 'package:doit/pages/home/view/widgets/pomo.dart';
import 'package:doit/pages/home/view/widgets/stats.dart';
import 'package:doit/pages/home/view/widgets/todo_mob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DOITBottomNavBar extends StatelessWidget {
  const DOITBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    

    final _theCon = Theme.of(context);
    return  Align(
      alignment: const FractionalOffset(0.5, 0.9891),

      child: DecoratedBox(
        decoration:  BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(20),
          color:  _theCon.scaffoldBackgroundColor.withAlpha(20) ,
          boxShadow:  [
            BoxShadow(
            color: _theCon.cardTheme.shadowColor!.withAlpha(99),
            offset: Offset.zero,
      
            blurRadius: 9,
            blurStyle:  BlurStyle.outer
      
          ),],
         
        ),
        child:  ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              
                  sigmaX: 24, sigmaY: 24 )
               ,
            child: FractionallySizedBox(
              widthFactor: 0.9,
              heightFactor: 0.0915 ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const SizedBox(
                    ),
                   GestureDetector(
                        onTap: (){ 
                         
                          showCupertinoDialog(context: context, builder: (_)=>const DOITGoalPage(), useRootNavigator: false, barrierDismissible: false, );
                        },
                        child:
                    Column(
                  
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        
                        Text("Goal",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 10.2,
                                    letterSpacing: 3,
                                    fontFamily: 'Jura-bold'
                        ),), const SizedBox(
                          height : 3
                        ),
               Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(CupertinoIcons.calendar_today,   size: 20.1, ),
                        )
                    
                      ],
                    ),),
                    
                     GestureDetector(
                        onTap: (){ 
                         
                          showCupertinoDialog(context: context, builder: (_)=>const DOITPomo(), useRootNavigator: false, barrierDismissible: false, );
                        },
                        child:
                    Column(
                  
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        
                        Text("Pomo",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 10.2,
                                    letterSpacing: 3,
                                    fontFamily: 'Jura-bold'
                        ),), const SizedBox(
                          height : 3
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(CupertinoIcons.alarm,   size: 20.1, ),
                        )
                       
                      ],
                    ),),
                              GestureDetector(
                        onTap: (){ 
                         
                          showCupertinoDialog(context: context, builder: (_)=>const DOITStats(), useRootNavigator: false, barrierDismissible: false, );
                        },
                        child:
                    Column(
                  
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        
                        Text("Stats",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 10.2,
                                    letterSpacing: 3,
                         
                        ),), const SizedBox(
                          height : 3
                        ),
               Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(CupertinoIcons.chart_bar_circle,   size: 20.1, ),
                        )
                      
                      ],
                    ),),
                                           GestureDetector(
                        onTap: (){ 
                         
                          showCupertinoDialog(context: context, builder: (_)=>const TodoMob(), useRootNavigator: false, barrierDismissible: false, );
                        }, child: 
                  
                    Column(
                  
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        
                        Text( "Task",  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 10.2,
                                    letterSpacing: 3,
                        ),), const SizedBox(
                          height : 3
                        ),
                  
                        Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(CupertinoIcons.today,   size: 20.1, ),
                        )
                        
                      ],
                    ),),
                  const SizedBox()
                 
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}