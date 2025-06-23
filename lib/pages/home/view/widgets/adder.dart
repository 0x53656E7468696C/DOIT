import 'package:doit/core/mapper.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/view/widgets/popup_nav.dart';
import 'package:doit/pages/home/view/widgets/todo.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DOITMapper extends StatelessWidget {
  final Mapper mapper;
  
  const DOITMapper({super.key, required this.mapper});
  @override
  Widget build(BuildContext context) {
    debugPrint(" widget rebuild check Mapper");
    switch(mapper){
     case Mapper.TaskMapper: return const PopScope(
            canPop: false,
            child: Stack(
       alignment: Alignment.center,
       children: [
         SizedBox(
           child: DOITCard(
             child: SizedBox(
               height: 450,
               child: Column(
                 children: [
                 PopupNav(data: "Add", ico : CupertinoIcons.add_circled ),
                   DOITTextFeild(hint: "Task", )
                 ],
               ),
             ),
           ),
         ),
       ],
            ),
          );
      case Mapper.GoalMapper:
      return const PopScope(
            canPop: false,
            child: Stack(
       alignment: Alignment.center,
       children: [
         SizedBox(
           child: DOITCard(
             child: SizedBox(
               height: 450,
               child: Column(
                 children: [
                 PopupNav(data: "Add", ico : CupertinoIcons.add_circled ),
                   Column(
                     children: [
                       DOITTextFeild(hint: "Goal", ),
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
       ],
            ),
          );
   
     
      case Mapper.TimeLogMapper:
      return const PopScope(
            canPop: false,
            child: Stack(
       alignment: Alignment.center,
       children: [
         SizedBox(
           child: DOITCard(
             child: SizedBox(
               height: 450,
               child: Column(
                 children: [
                 PopupNav(data: "Add", ico : CupertinoIcons.add_circled ),
                   Column(
                     children: [
                       DOITTextFeild(hint: "Time Log", ),
                     ],
                   )
                 ],
               ),
             ),
           ),
         ),
       ],
            ),
          );
    } 
}
}

class DOITTextFeild extends StatefulWidget {
  final String hint;
  const DOITTextFeild({super.key, required this.hint});

  @override
  State<DOITTextFeild> createState() => _DOITAdderState();
}

class _DOITAdderState extends State<DOITTextFeild> {
   late final TextEditingController _controller;
   late final TextEditingController _controller2;
    DateTime? temp;
    var tempDeadLine;
    int? colorIndx;
    final List<Color> _color = [ Colors.deepOrangeAccent,  Colors.blueAccent,  Colors.greenAccent,  const Color.fromARGB(255, 171, 136, 254),  Colors.amber,  Colors.redAccent];
    late final bool isGoal = widget.hint.contains("Goal") ;
    late final bool isTask = widget.hint.contains("Task");
    

@override
  void initState() {
    super.initState();
        debugPrint("state is init");
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {   
     debugPrint("state is disposeed");
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    final thecon =  Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:  21.0),
          child: TextField(
            controller: _controller,
            decoration:  InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal:21, ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: thecon.textTheme.titleSmall!.color!
                )
              ),
              
              hintText:'   Enter ${widget.hint}',
              hintStyle: thecon.textTheme.titleSmall
            ),
          
          ),
        ),
       
       isGoal ?    Padding(
         padding: const EdgeInsets.only(top : 18.0),
         
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
           children: [
                Padding(
                  padding: const EdgeInsets.only(top:  8.1),
                  child: const Text("   Deadline ",),
                ),
             SizedBox(
                    width: 270,
                    height: 90,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                   dateTimePickerTextStyle: thecon.textTheme.titleSmall
             
                        ),
                      ),
                      child: CupertinoDatePicker(
                        
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (d){
                          debugPrint(d.toString());
                          temp = d;
                        }
                      ),
                    ),
                  ),
           ],
         ),
       ) : isTask ? 
       Column(
              spacing: 12,
              children: [
            
                   Padding(
                      padding: const EdgeInsets.symmetric(horizontal:  21.0),
                      child: TextField(
                        controller: _controller2,
                        style: thecon.textTheme.bodyMedium,
                        
                        decoration:  InputDecoration(
             
            contentPadding: EdgeInsets.symmetric(horizontal:21, ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: thecon.textTheme.titleSmall!.color!
              )
            ),
            
            hintText:'   detail',
            hintStyle: thecon.textTheme.titleSmall
                        ),
                      
                      ),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                     const   Text("   Deadline "),
                         SizedBox(
                          width: 150,
                          height: 90,
                           child: CupertinoTheme(
                                         data: CupertinoThemeData(
                                           textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: thecon.textTheme.titleSmall
                           
                                           ),
                                         ),
                                         child: CupertinoDatePicker(
                                           mode: CupertinoDatePickerMode.time,
                                           onDateTimeChanged: (d){
                                             debugPrint(d.toString());
                                             temp = d;
                                             
                                           }
                                         ),
                                       ),
                         ),
                       ],
                     ),
           
               // for repeatable        
            // SizedBox(
            //           width: 270,
            //           height: 90,
            //            child: CupertinoTheme(
            //     data: CupertinoThemeData(
            //       textTheme: CupertinoTextThemeData(
            //  dateTimePickerTextStyle: thecon.textTheme.titleSmall
                       
            //       ),
            //     ),
            //     child: CupertinoDatePicker(
            //       mode: CupertinoDatePickerMode.date,
            //       onDateTimeChanged: (d){
            //         debugPrint(d.toString());
            //         temp = d;
            //       }
            //     ),
            //   ),
            //          ),
                     
                       
              ],
            ) :

            const Padding(
              padding:  EdgeInsets.only(top : 24.0),
              child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
              
                children: [
                                          Text(" Start "),
                       Text("End "),
              
                ],
              
              ),
            ),
       if(!isTask && !isGoal) Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                         SizedBox(
                          width: 150,
                          height: 90,
                           child: CupertinoTheme(
                                         data: CupertinoThemeData(
                                           textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: thecon.textTheme.titleSmall
                           
                                           ),
                                         ),
                                         child: CupertinoDatePicker(
                                           mode: CupertinoDatePickerMode.time,
                                           onDateTimeChanged: (d){
                                             temp = d;
                                           }
                                         ),
                                       ),
                         ),
                          SizedBox(
                          width: 150,
                          height: 90,
                           child: CupertinoTheme(
                                         data: CupertinoThemeData(
                                           textTheme: CupertinoTextThemeData(
                                      dateTimePickerTextStyle: thecon.textTheme.titleSmall
                           
                                           ),
                                         ),
                                         child: CupertinoDatePicker(
                                           mode: CupertinoDatePickerMode.time,
                                           onDateTimeChanged: (d){
                                             tempDeadLine = d;
                                           }
                                         ),
                                       ),
                         ),
                   
                       ],
                     ),
           
         if(!isTask && !isGoal)   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                       Text("   Assign a Color"),
                          SizedBox(
                          width: 81,
                          height: 30,
                           child: CupertinoPicker(
                            looping: true,
                            itemExtent: 24,
                            children: [
                              ColoredBox(color: _color[0], child: SizedBox(
                                width: 52,
                              ),), ColoredBox(color:_color[1], child: SizedBox(
                                width: 52,
                              ),), ColoredBox(color:_color[2], child: SizedBox(
                                width: 52,
                              ),), ColoredBox(color:_color[3], child: SizedBox(
                                width: 52,
                              ),), ColoredBox(color:_color[4], child: SizedBox(
                                width: 52,
                              ),), ColoredBox(color:_color[5], child: SizedBox(
                                width: 52,
                              ),)
                            ],
                             onSelectedItemChanged: (i){
                              colorIndx = i;
                             }
                           ),
                         ),
                   
                       ],
                     ),
         
        Padding(
          padding: const EdgeInsets.only(top : 18.0),
          child: CupertinoButton.filled(onPressed: isGoal ? () => context.read<HomeBloc>().add(SetGoal(name: _controller.text, date: temp)) : isTask ? ()=>context.read<HomeBloc>().add(SetTask(title:  _controller.text, detail:  _controller2.text, hour:  temp?.hour ?? 9, minute:  temp?.minute ?? 09))  : ()=>context.read<HomeBloc>().add(SetTimeLog(
            startDate: temp ,
            endDate: tempDeadLine ,
            colorIndx: colorIndx ?? 0,
            name: _controller.text
          )) ,
          child: SizedBox(
            width: 60,
            child: Row(
              children: [
                
                Text(' send  '),
                Icon(CupertinoIcons.rocket)
              ],
            ),
          ),  ),
        )
      ],
    );
  }
}

