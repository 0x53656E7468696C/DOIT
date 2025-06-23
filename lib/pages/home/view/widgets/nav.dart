
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:doit/pages/prefs/view/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DOITNav extends StatelessWidget {
  const DOITNav({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.1 , horizontal: 15),
      child: SizedBox(
         height:  24,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){ 
 
                showCupertinoDialog(context: context, builder: (_)=>const Prefs(), useRootNavigator: false, barrierDismissible: false, );
              },
              child: Icon(CupertinoIcons.settings_solid, )
              ),
        
            Padding(
              padding: const EdgeInsets.only(top : 1.2),
              child: BlocBuilder<HomeBloc,HomeState>(
                buildWhen: (pre,cur) => pre.selectedMonthIndex != cur.selectedMonthIndex,
                builder: (context, state) {
                  debugPrint("rebuild happended ");
                  return Text("${state.selectedmon} ${state.homeYear ?? 2025 }", style: _con.titleSmall!.copyWith(
                    color: _con.titleLarge!.color!.withAlpha(180),
                    
                  ),);
                }
              ),
            ),
        
          ],
        ),
      ),
    ) ;
  }
}