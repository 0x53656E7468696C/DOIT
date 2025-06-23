
import 'package:doit/core/ui/colors.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/prefs/view/widget/dialog.dart';
import 'package:doit/pages/prefs/view/widget/switcher.dart';
import 'package:doit/pages/prefs/viewmod/pref_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Prefs extends StatelessWidget {
  const Prefs({super.key});

  @override
  Widget build(BuildContext context) {
    final _blocCxt = context.read<PrefsBloc>();
    return Stack(
      alignment: Alignment.center,
      children: [

         DOITCard(
           child: SizedBox(
            width: 390,
            height: 450,
            child:  Column( 
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    GestureDetector(
                      onTap: (){
                                    Navigator.of(context).pop();
                                  },
                      child: Container(
                        height: 24,
                        width: 33,
                        decoration: BoxDecoration(
                          color: DOITColors.pinkish,
                                         borderRadius: BorderRadius.circular(10),
                                         ),
                        child: Center(
                child: Text("-", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 fontSize: 22
                ),),
              ),
                      ),
                    ),
               Text("DOIT", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                 fontSize: 18
                ),),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 27.0, right: 27, bottom: 12),
                child: Column(
                  children: [
                 const SizedBox(
                height: 99,
                width: 99,
                child: DecoratedBox(decoration: BoxDecoration(
                  
                  image: DecorationImage(image: AssetImage('lib/core/ui/img/icon.png',),
                  
                  )
                )),
              ),
              const Text("V 1.1.1 ",),
              const SizedBox(height: 21,),
              SizedBox(
                width: 200,
                height: 260,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "LANG",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 10.2,
                              letterSpacing: 3
                  ),),
                    Text( "En ",
                      style: Theme.of(context).textTheme.titleSmall!,
                    ),
                  ],
                ),
                  const SizedBox(height: 21,),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "DARK",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                 fontSize: 10.2,
                                 letterSpacing: 3
                  ),),
                  BlocBuilder<PrefsBloc, PrefState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 33,height: 21,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(value: state.isDarkTheme , onChanged: (val) => _blocCxt.add(SetThemeEvent(value: val),
                          
                          ),
                          activeTrackColor: DOITColors.shadowColorLit,
                          thumbColor: DOITColors.cardDark,
                          inactiveThumbColor: DOITColors.cardLit,
                          ),
                        ),
                      );
                    }
                  ),
                
                  ],
                ),
                
                  const SizedBox(height: 21,),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "AM|PM",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                 fontSize: 10.2,
                                 letterSpacing: 3
                  ),),
                  SizedBox(
                        width: 33,height: 21,
                        child:
                         BlocBuilder<PrefsBloc, PrefState>(
                    builder: (context, state) {
                      return
                         FittedBox(
                          fit: BoxFit.contain,
                          child: CupertinoSwitch(value: state.isMeridiem , onChanged: (_) => _blocCxt.add(
                            SetMeridiemEvent()
                          ),
                          activeTrackColor: DOITColors.shadowColorLit,
                          thumbColor: DOITColors.cardDark,
                          inactiveThumbColor: DOITColors.cardLit,
                          ),
                        );
                    }
                  ),
                      )
                
                  ],
                ),
                  const SizedBox(height: 21,),
                           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "WIDGET",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 10.2,
                              letterSpacing: 3
                  ),),
                    GestureDetector(
                      onTap: () => showCupertinoDialog(context: context, builder: (_) => DOITpopup(widget: Center(child: Text("Coming soon ....")), func: (){}, width: 201, height: 102)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.1),
                        child: Stack(
                          children: [
                           Transform.translate(
                             offset: Offset(11.1, 11.1),
                             child: Icon( CupertinoIcons.add_circled,
                              size: 12,
                              ),
                           ),
                            Icon( CupertinoIcons.home,
                            size: 16.2,
                            ),
                          ],
                        ),
                      ),
                    ),
                
                  ],
                ),
                  const SizedBox(height: 21,),
                              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "IMPORT",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 10.2,
                              letterSpacing: 3
                  ),),
                    GestureDetector(
                      onTap: () => showCupertinoDialog(context: context, builder: (_) => DOITpopup(widget: Center(child: Text("Coming soon ....")), func: (){}, width: 201, height: 102)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.1),
                        child: Icon( CupertinoIcons.square_arrow_down,
                        size: 18,
                        ),
                      ),
                    ),
                
                  ],
                ),
                  const SizedBox(height: 21,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "EXPORT",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 10.2,
                              letterSpacing: 3
                  ),),
                    GestureDetector(
                      onTap: () => showCupertinoDialog(context: context, builder: (_) => DOITpopup(widget: Center(child: Text("Coming soon ....")), func: (){}, width: 201, height: 102)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.1),
                        child: Icon( CupertinoIcons.square_arrow_up,
                        size: 18,
                        ),
                      ),
                    ),
                
                  ],
                ),
                  const SizedBox(height: 21,),
                            
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.timer,
                        size: 15,
                      ),
                      Text(" START OF",
                      style: Theme.of(context).textTheme.titleSmall,
                      ),
                
                    ],
                  ),
                const SizedBox(height: 9,),
                               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "DAY",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                 fontSize: 10.2,
                
                              letterSpacing: 3
                  ),),
                             
                      GestureDetector(
                        onTap:() => showCupertinoDialog( builder: (context) => const HourSwitcher(), context: context  ),
                        child: BlocBuilder<PrefsBloc, PrefState>(
                          builder: (context, state) {
                            debugPrint("rebuild happened");
                            return Text('${state.startOfDay.toString()}  ',
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontSize: 12
                            ),
                            
                            );
                          }
                        ),
                      ) 
                 
                
                  ],
                ),
                               const SizedBox(height: 12,),
                      Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text( "WEEK",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                 fontSize: 10.2,
                
                              letterSpacing: 3
                  ),),
                          
                         GestureDetector(
                          onTap: () => showCupertinoDialog(context: context, builder: (_) => const DaySwitcher() ),
                           child: BlocBuilder<PrefsBloc, PrefState>(
                            buildWhen: (pre, cur) => ( pre.startOfWeek.toString() != cur.startOfWeek.toString() ) && cur.startOfWeek != null ,
                                               builder: (ctx, state) {
                                                debugPrint("rebuild happend");
                                                 return Text(state.startOfWeek.toString(),   style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),);
                                               }
                                        
                                             ),
                         ),
                
                  ],
                ),
                               
                    ],
                  ),
                ),
              )
              
                         
                              
                  ],
                ),
              ),
            ),
           
          ],
         )
           ),
           
         ),
        
         
        
      ],
    );
 }
}