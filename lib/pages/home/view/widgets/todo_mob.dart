
import 'package:doit/core/ui/colors.dart';
import 'package:doit/core/ui/theme.dart';
import 'package:doit/pages/home/view/widgets/btns.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/view/widgets/popup_nav.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoMob extends StatelessWidget {
  const TodoMob({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHome());
    return const Center(
      child: DOITCard(
        child: SizedBox(
          height: 500,
          child: Column(
            
            children: [
            PopupNav(data: "Task", ico : CupertinoIcons.today ),
            DOITAddBtn(isGoal: false),
              Expanded(
                child: TaskList()
              )
            ],
          ),
        ),
      ),
    );
  }
}



class GoalList extends StatelessWidget {
  const GoalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -39),
      child: Center(
        child: DOITCard(
          child: SizedBox(
            width: 270,
            height: 270,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (ctx, state) {
                return ListView.builder(
                  itemCount: state.goalsList!.length,
                  hitTestBehavior: HitTestBehavior.translucent,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_,i) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 21, top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.goalsList![i]['title']),
                            CupertinoCheckbox(value: state.goalsList![i]['complete'] ?? true, onChanged: (v) => context.read<HomeBloc>().add(Ticker(type: 'goal', state: v, index: i)),  checkColor: DOITColors.bluelish,
                          activeColor: DOITColors.bluelish, fillColor: WidgetStateProperty.all(Theme.of(context).extension<ColorExt>()!.DOITCardColor))
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 252,
                        child:  Divider(
                          thickness: 0.5,
                          height: 0.15,
                        ),
                      ),
                    ],
                  ),
                        
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}





class TaskList extends StatelessWidget {
  const TaskList({super.key});
 
  @override
  Widget build(BuildContext context) {
    final thecon = Theme.of(context);
    return SizedBox(
      width: 291,
      height: 400,
      child: BlocBuilder<HomeBloc,HomeState>(
        builder: (ctx, s) {
 
          final List<Map> items = s.taskList ?? []; 
                  debugPrint('from taskList' + items.toString());
                                    debugPrint('from taskList' + s.taskList.toString());

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i) =>   
              DOITCard(child:
               SizedBox(
                height: 78,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left:  27.0, right: 21),
                      child: Row(  
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text(items[i]['title'], style: thecon.textTheme.bodyLarge!.copyWith(
                              fontSize: 12.8,
                              color: thecon.textTheme.titleMedium!.color
                            ), ),
                          Text( "${items[i]['hour']} : ${items[i]['min']}", style: thecon.textTheme.titleSmall!.copyWith(
                              fontSize: 11.7,
                              color: thecon.textTheme.titleMedium!.color
                            ) ,),
                        ],
                      ),
                    ),
                    Row(
                       mainAxisAlignment:MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
          
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, top: 3),
                          child: SizedBox(
                            width: 189,
                            child: Text(items[i]['detail'], style: thecon.textTheme.bodyMedium!.copyWith(
                              fontSize: 10.8,
                              color: thecon.textTheme.bodySmall!.color
                            ), softWrap: true,
                            maxLines: 2,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right:  24.0),
                          child: CupertinoCheckbox(value: items[i]['complete'] ?? false, onChanged: (val) => ctx.read<HomeBloc>().add(
                            Ticker(type: 'task', state: val, index: i )
                          ) , checkColor: DOITColors.bluelish,
                          activeColor: DOITColors.bluelish, fillColor: WidgetStateProperty.all(thecon.extension<ColorExt>()!.DOITCardColor),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ,
           
            
           
          );
        }
      ),
    );
  }
}