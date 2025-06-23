part of 'pref_bloc.dart';
class PrefState{
  final bool isDarkTheme;
  final int? selectedDay;
  final int? selectedHour;
  final bool isMeridiem;
  
  static const Map<int,String> _day = {
    1: 'Mon',
    2: 'Tue',
    3 : 'Wed',
    4 : 'Thu',
    5 : 'Fri',
    6 : 'Sat',
    7 : 'Sun',
  };
  

  static const  List<int> _hour = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23];
 get startOfWeek => _day[selectedDay] ?? 'Mon' ;
 get startOfDay  => _hour[selectedHour!] ;

  const PrefState({
     this.isDarkTheme = false,
      this.selectedDay = 1,
      this.selectedHour = 9,
      this.isMeridiem = true
  });
  PrefState copyWith({
    bool? isDarkTheme, selectedDay,
      selectedHour, isMeridiem
  }){

    return PrefState( 
    isDarkTheme : isDarkTheme ?? this.isDarkTheme,
    selectedDay: selectedDay ?? this.selectedDay,
    selectedHour: selectedHour ?? this.selectedHour ,
    isMeridiem: isMeridiem ?? this.isMeridiem
    
    );}
  
}

