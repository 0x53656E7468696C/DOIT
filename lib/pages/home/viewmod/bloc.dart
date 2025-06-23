import 'package:doit/core/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'event.dart';
part 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  final LocalStorage _lcsg = LocalStorage();
  HomeBloc():super(HomeState()){
    on<SwitchView>((event, emit){
      if (event.size.isNaN) return;
      if (event.size < 600) emit(state.copyWith(isMobileView: true));
      if (event.size > 600) emit(state.copyWith(isMobileView: false));
    });
    on<SetHomeMYEvent>((event,emit){
 {emit(state.copyWith(selectedMonthIndex: event.m, homeYear: event.year)) ;
      }    });
      on<DropHomeMYEvent>((event, emit){
        emit(state.copyWith(
          homeYear: null,
          selectedMonthIndex: null,
          refrsher: !state.refrsher
        ));});

     
        on<SetGoal>((event, emit) async{

          debugPrint('your set goal' + event.name.toString() + event.date.toString());
          if ( event.name == null || event.name!.isEmpty) {
            emit(state.copyWith(
              status: 'Invalid name'
            ));
            return;
          }
         final int date = int.parse(
            (event.date?.day ?? state.today ).toString() +
          (event.date?.month ?? state.month ).toString() +
           (event.date?.year  ?? state.year).toString() 
          );
          try{
            debugPrint('your set goal' + date.toString());
          await _lcsg.saveGoals( {
            'title' : event.name,
            'complete' : false
          } , date );
          }
          catch(e){
            debugPrint('from SaveGoals : ' + e.toString() );
          }
        });



        on<SetTimeLog>((event, emit) async {

          final int date = int.parse(
             state.today.toString() +
           state.month.toString() +
           state.year.toString() 
          );
          debugPrint('your set timelog' + date.toString());

            debugPrint('your set timelog' + event.name.toString() + event.startDate.toString() + event.endDate.toString() + event.colorIndx.toString());
if ( event.name == null || event.name!.isEmpty) {
            emit(state.copyWith(
              status: 'Invalid name'
            ));
            return;
          }
          if(event.startDate == null || event.endDate == null) { emit(state.copyWith(
            status: ' set Duration '
          ));  return ;}
          if( !(event.startDate!.isAfter(event.endDate!))){
            emit(state.copyWith(
              status: 'set Duration'
            ));
            return;
          }
       
          try{
            debugPrint('your set timelog' + date.toString());
          await _lcsg.saveTimeLog( {
            'title' : event.name,
            'colorIndx' : event.colorIndx,
            'startTime' : event.startDate,
            'endTime' : event.endDate
          } , date );
          }
          catch(e){
            debugPrint('from SaveTimelog : ' + e.toString() );
          }
        });

         on<SetTask>((event, emit) async {
          final int date = int.parse(
             state.today.toString() +
           state.month.toString() +
           state.year.toString() 
          );
          if(event.title == null){ emit(state.copyWith(
            status: 'Enter Title'
          ));
          return;
          }
          if( event.detail != null && event.detail!.length > 48 ) {
            emit(state.copyWith(
              status: ' Details len should less than 48 '
            ));
            return;
          }
          try{
              debugPrint('your set task' + date.toString());
              debugPrint('your set task' + event.title.toString() + event.hour.toString() + event.minute.toString() + event.detail.toString());
          await _lcsg.saveTask(
            {
              'title' : event.title,
              'detail' : event.detail,
              'hour' :event.hour ,
              'min' : event.minute,
              'complete' : false
            },
           date );}catch(e){debugPrint(e.toString());}
           emit(state.copyWith(
            status: '201'
           ));
         });
         on<Ticker>((event, emit) {
          debugPrint(event.state.toString());
           if (event.type == 'goal') {
             final updatedGoals = List<Map>.from(state.goalsList ?? []);
             if (event.index >= 0 && event.index < updatedGoals.length) {
               updatedGoals[event.index] = {
                 ...updatedGoals[event.index],
                 'complete': event.state
               };
               debugPrint(updatedGoals.toString());               emit(state.copyWith(goalsList: updatedGoals));
             }
           } else {
             final updatedTasks = List<Map>.from(state.taskList ?? []);
             if (event.index >= 0 && event.index < updatedTasks.length) {
               updatedTasks[event.index] = {
                 ...updatedTasks[event.index],
                 'complete': event.state
               };
               emit(state.copyWith(taskList: updatedTasks));
             }
           }
         });
on<LoadHome>((event,emit) async {
final int date = int.parse(
            ( state.today).toString() +
           ( state.month).toString() +
           ( state.year).toString() 
          );

            debugPrint('your set homeState' + date.toString());

  final task = await _lcsg.loadTask(date); 
  final goal = await _lcsg.loadGoals(date);
  final timelog = await _lcsg.loadTimeLog(date);
  debugPrint( ' from task ' +task.toString());
  debugPrint( ' from goal ' + goal.toString());
  debugPrint( ' from timeLog ' + timelog.toString());
  emit(state.copyWith(
    taskList: task,
    goalsList: goal,
    timeLogList: timelog
  ));
});
  }
 
}


  //  final int date = int.parse(
  //           (event.date?.day ?? state.today ).toString() +
  //         (event.date?.month ?? state.month ).toString() +
  //          (event.date?.year  ?? state.year).toString() 
  //         );
// 