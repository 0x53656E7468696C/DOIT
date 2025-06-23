part of 'bloc.dart';

sealed class HomeEvent{}


class SetHomeMYEvent extends HomeEvent{

 final int m;
 final int year;
   SetHomeMYEvent({required this.m,required this.year});
}
class SetTimeEvent extends HomeEvent{}
class SetGoal extends HomeEvent{
  final DateTime? date;
  final String? name;
   SetGoal({this.date, this.name});
}
class SetTask extends HomeEvent{
   final  String? title;
   final  String? detail;
   final  int? hour;
   final  int?minute;
   SetTask( {  this.title, this.detail, this.hour, this.minute});
}
class SetTimeLog extends HomeEvent{
  final DateTime? startDate;
  final DateTime? endDate;
  final int? colorIndx;
  final String? name;
   SetTimeLog({this.startDate, this.endDate, this.colorIndx, this.name});
}
class SetTimer extends HomeEvent{}

class DropHomeMYEvent extends HomeEvent{}
class DropDateEvent extends HomeEvent{}
class DropTimeEvent extends HomeEvent{}
class DropGoal extends HomeEvent{}
class DropTask extends HomeEvent{}
class DropTimeLog extends HomeEvent{}
class DropTimer extends HomeEvent{}

class LoadHome extends HomeEvent{}

class SwitchView extends HomeEvent{
  final double size;
   SwitchView(
    this.size
  );
}

class Ticker extends HomeEvent{
  final String type;
  final bool? state;
  final int index;
 Ticker({required this.type, required this.state, required this.index});

}