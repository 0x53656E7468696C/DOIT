part of 'bloc.dart';

class HomeState{
  final bool isMobileView;
  final int? selectedDate;
  final int? selectedDayIndex;
  final int? homeYear;
  final int? selectedMonthIndex;
  final bool refrsher ;
  final String? status;
  final List<Map>? taskList;
  final List<Map>? goalsList;
  final List<Map>? timeLogList;

  static final DateTime _now = DateTime.now();

  static const double _itemwidth = (45 + (9.3 * 2)) * 30;
  static const _weeks = ['Mon','Tue','Wed','Thu','Fri','Sat','Sun'];
  static const _mon = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  
  int get today => _now.day;
  int get month => _now.month;
  int get year => _now.year;
  double get itemwidth => _itemwidth;
  // int get startDate => _now.subtract(duration);
  get selectedweek => _weeks[selectedDayIndex ?? _now.weekday]; 
  get selectedmon => _mon[selectedMonthIndex ?? _now.month - 1]; 


  const HomeState( {this.refrsher = false, this.taskList , this.goalsList, this.timeLogList, this.status  ,this.selectedDate,this.selectedDayIndex,  this.homeYear, this.selectedMonthIndex, this.isMobileView = false});

  HomeState copyWith({
    List<Map>? timeLogList, List<Map>? goalsList,
     List<Map>? taskList, String? status,
      bool? isMobileView, int? selectedDate, int? homeYear, int? selectedMonthIndex,int? selectedDayIndex, bool? refrsher, 
    }
  ){
    return HomeState(
      timeLogList: timeLogList ?? this.timeLogList,
      goalsList: goalsList ?? this.goalsList,
      taskList: taskList ?? this.taskList,
      refrsher : refrsher ?? this.refrsher,
      status: status ?? this.status,
      selectedDayIndex : selectedDayIndex ?? this.selectedDayIndex,
      isMobileView: isMobileView ?? this.isMobileView,
      selectedDate: selectedDate ?? this.selectedDate,
      homeYear: homeYear ?? this.homeYear,
      selectedMonthIndex: selectedMonthIndex ?? this.selectedMonthIndex,
    );
  }

}