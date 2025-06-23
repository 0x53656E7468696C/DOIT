import 'package:doit/core/mapper.dart';
import 'package:doit/pages/home/view/widgets/adder.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DOITResetBtn extends StatelessWidget {

  const DOITResetBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: () => context.read<HomeBloc>().add(DropHomeMYEvent()),
                    child: const Padding(
                      padding:  EdgeInsets.only(bottom: 7.2, left: 18),
                      child: Icon(CupertinoIcons.refresh_circled,   size: 20.1, ),
                    )
                    );
  }
}



class DOITAddBtn extends StatelessWidget {
  final bool isGoal;
  const DOITAddBtn({super.key, required this.isGoal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: (){          
                      showCupertinoDialog(context: context, builder: (_)=> isGoal ? DOITMapper(mapper: Mapper.GoalMapper ) : DOITMapper(mapper: Mapper.TaskMapper) , useRootNavigator: false, barrierDismissible: false, );
                    },
                    child: const Padding(
                      padding:  EdgeInsets.only(bottom: 7.2, left: 18),
                      child: Icon(CupertinoIcons.add_circled,   size: 20.1, ),
                    )
                    );
  }
}