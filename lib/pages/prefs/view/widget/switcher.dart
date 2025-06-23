import 'package:doit/core/ui/colors.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/prefs/viewmod/pref_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HourSwitcher extends StatelessWidget {
  const HourSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    int _temp = 24;
    return Center(
      child: DOITCard(
        child: SizedBox(
                            width: 201,
                          height: 102,
                            child: Stack(  
                              children: [
                           
                                CupertinoPicker(
                                  onSelectedItemChanged: (d) => {_temp = d},
                                 itemExtent: 18,
                                 children: [
                                  Text("0", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("1", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("2", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("3", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("4", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("5", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("6", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("7", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("8", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("9", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("10", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("11", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("12", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("13", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("14", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("15", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("16", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("17", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("18", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("19", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("20", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("21", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("22", style: Theme.of(context).textTheme.bodySmall,),
                                  Text("23", style: Theme.of(context).textTheme.bodySmall,),
                                 ],
                                 
                                ),
                                       Transform.translate(
                                    offset: Offset(9, 6),
                                    child: Container(
                                                            height: 24,
                                                            width: 33,
                                                            decoration: BoxDecoration(
                                                            color: DOITColors.pinkish,
                                                       borderRadius: BorderRadius.circular(10),
                                                       ),
                                                            child: GestureDetector(
                                                  onTap: (){
                                                    context.read<PrefsBloc>().add(SetDHourEvent(_temp));
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Center(
                                                    child: Text("-", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                     fontSize: 22
                                                    ),),
                                                  )
                                                  ),
                                                    ),
                                  ),
                                
                              ],
                            ),
                          ),
      ),
    );
  }
}


class DaySwitcher extends StatelessWidget {
  const DaySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
  int _temp = 0;
    return Center(
      child: DOITCard(
        child: SizedBox(
                            width: 201,
                          height: 102,
                            child: Stack(  
                              children: [
                           
                                CupertinoPicker(
                                  onSelectedItemChanged: (d) => {_temp = d + 1},
                                 itemExtent: 18,
                                 children: [
                             Text("Mon", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Tue", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Wed", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Thu", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Fri", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Sat", style: Theme.of(context).textTheme.bodySmall,),
                            Text("Sun", style: Theme.of(context).textTheme.bodySmall,),
                                 ],
                                 
                                ),
                                       Transform.translate(
                                    offset: Offset(9, 6),
                                    child: Container(
                                                            height: 24,
                                                            width: 33,
                                                            decoration: BoxDecoration(
                                                            color: DOITColors.pinkish,
                                                       borderRadius: BorderRadius.circular(10),
                                                       ),
                                                            child: GestureDetector(
                                                  onTap: (){
                                                    context.read<PrefsBloc>().add(SetDDayEvent(_temp));
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Center(
                                                    child: Text("-", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                     fontSize: 22
                                                    ),),
                                                  )
                                                  ),
                                                    ),
                                  ),
                                
                              ],
                            ),
                          ),
      ),
    );
  }
}