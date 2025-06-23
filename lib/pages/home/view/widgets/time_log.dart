import 'package:doit/core/mapper.dart';
import 'package:doit/core/ui/colors.dart';
import 'package:doit/core/ui/theme.dart';
import 'package:doit/pages/home/view/widgets/adder.dart';
import 'package:doit/pages/home/view/widgets/btns.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DOITTimeLog extends StatelessWidget {
  const DOITTimeLog({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("rebuid on timelog"); 

    return Padding(padding: const EdgeInsets.only(top: 33, left: 15, right: 15, ),
    child: FractionallySizedBox(
      heightFactor: 0.96,
      widthFactor: 0.87,
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
            physics: BouncingScrollPhysics(), 
       child: BlocBuilder<HomeBloc, HomeState>(
         builder: (context, state) {
          final List<Map> timeLogList = List<Map>.from(state.timeLogList ?? []);
          // state.timeLogList ?? [];
          final int length =  timeLogList.length;
           return Stack(
            alignment: Alignment.centerLeft,
             children: [
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                     children  : [
                 const  SizedBox(
                    height: 150,
                  ),
                      for(int i =0 ; i < 24; i++)
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: DecoratedBox(
                          decoration:  BoxDecoration(
                            boxShadow: [BoxShadow(
                              color: Theme.of(context).extension <ColorExt>()!.shadowColor,
                              blurRadius: 2.1,
                              blurStyle: BlurStyle.outer
               
                            )],
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                           color: i == 3 ? DOITColors.bluelish : Theme.of(context).scaffoldBackgroundColor,
                           
                            gradient:!(i == 3) ? null : LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            
                            Theme.of(context).cardColor,
                            Colors.blueAccent
                           ])
                          ),
                          child: SizedBox(
                          height:8.1,
                          width: 9,
                        )
                        ),
                      ),
                  
                               const  SizedBox(
                    height: 66,
                  ),
                    
                ],
                     ),
                     true ?
                  Padding(
                    padding: const EdgeInsets.only( left:  27.0, bottom: 49),
                    child: Center(child: Text(" Assign time to your work \n    by clicking on + btn  ", style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 12.3
                    ),), ),
                  )     : Padding(
                    padding: const EdgeInsets.only( left:  42.0),
                    child: DOITCard(
                      child: SizedBox(
                      height: 26.1,
                      child: FractionallySizedBox(
                        widthFactor: 0.96 ,
                        child: Padding(
                          padding: const EdgeInsets.only(top:  6.0, left: 18, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('title'),
                              Text('date')
                            ],
                          ),
                        ),
                      ),
                    )),
                  ),
       
             ],
           );
         }
       ),
    ),
    ));
  }
}


class DOITDateScroll extends StatelessWidget {
  const DOITDateScroll({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colorlist = [ Colors.deepOrangeAccent,  Colors.blueAccent,  Colors.greenAccent,  const Color.fromARGB(255, 171, 136, 254),  Colors.amber,  Colors.redAccent];
        debugPrint("rebuid on timelog2");
    return Align(
      alignment: const FractionalOffset(0, 0.054),
      child:
      SizedBox(
        height: 84,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 51,
              child: const DateScroll()
     


            ),
          
            Row(
              mainAxisAlignment:  MainAxisAlignment.start,
              children: [
                 Row( 
                  spacing: 12,
                   children: [
                     DOITResetBtn(),
                     GestureDetector(
                        onTap: (){ 
                         
                          showCupertinoDialog(context: context, builder: (_)=>const DOITMapper(
                            mapper: Mapper.TimeLogMapper,
                          ), useRootNavigator: false, barrierDismissible: false, );
                        },
                        child: const Padding(
                          padding:  EdgeInsets.only(bottom: 7.2, left: 18),
                          child: Icon(CupertinoIcons.add_circled,   size: 20.1, ),
                        )
                        ),
                   ],
                 ),
                    Expanded(child: const SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 7.2, right: 18),
                  child: SizedBox(
                    width: 111,
                    height: 12,
                    child: ListView.builder(
                      hitTestBehavior: HitTestBehavior.translucent,
                      physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.normal
                      ),
                      itemCount: colorlist.length,
                      scrollDirection: Axis.horizontal, itemBuilder: (BuildContext ctx, int index) =>
                  
                              Padding(
                                padding: EdgeInsets.only(left: 9),
                                child: Container( 
                                  decoration: BoxDecoration(
                                      color: colorlist[index], 
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                    width: 9 ,),
                              )
                       
                      
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class DateScroll extends StatefulWidget {
  const DateScroll({super.key});

  @override
  _DOITDateScrollState createState() => _DOITDateScrollState();
}

class _DOITDateScrollState extends State<DateScroll> {
  static const _weekday = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  static const daysBefore = 30;
  late final ScrollController _controller;
  late final DateTime _startDate;
  late final double itemwidth;
  @override
  void initState() {
    super.initState();
    itemwidth =  context.read<HomeBloc>().state.itemwidth;
    _startDate = DateTime.now().subtract(const Duration(days: daysBefore));
    _controller = ScrollController(initialScrollOffset: itemwidth);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(" Widget scrollveiew rebuild ");
    final refr =  context.select((HomeBloc bloc)=> bloc.state.refrsher);
    if( (refr)  ) {
      _controller.jumpTo(itemwidth );
         debugPrint(" Wit scrollveiew rebuild ");
    }
    return SizedBox(
      height: 84,
      child:
         ListView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (ctx, index) {
              final date   = _startDate.add(Duration(days: index));
              final day    = _weekday[date.weekday - 1];
              final year = date.year;
              final month = date.month - 1;
              final dayNum = date.day.toString();
              context.read<HomeBloc>().add(SetHomeMYEvent(m: month, year: year));
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7.8, vertical: 1.5),
                child: GestureDetector(
                  onTap: () {/* your tap logic */},
                  child: DOITCard(
                    child: SizedBox(
                      width: 45,
                      height: 45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(day,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 9)),
                          Text(dayNum,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
                 )
    
   
    );
  }
}
