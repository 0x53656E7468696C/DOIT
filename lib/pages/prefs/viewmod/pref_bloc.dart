


import 'package:doit/core/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class PrefsBloc extends Bloc<PrefEvent, PrefState>{
  final LocalStorage _lcsg = LocalStorage();
  PrefsBloc():super(PrefState()){
    
    on<SetThemeEvent>((
      event, emit
    ) async {
      try {
        await _lcsg.savpref(isDark: event.value!);
      
      emit((state.copyWith(
        isDarkTheme: event.value
      ))); }
      catch(_){ } 
    });
on<SetDDayEvent>((event, emit){
  debugPrint("the widget shoud rebuild as day set got : ${event.dayIndex}");
    if( event.dayIndex! < 8 && event.dayIndex! > 0 ){
  emit((state.copyWith( selectedDay: event.dayIndex)));
  }
  });
  
  on<SetDHourEvent>((event, emit){
  if (event.hourIndex! < 24 && event.hourIndex! >= 0) {
  emit(state.copyWith(selectedHour: event.hourIndex));
  }
  });
  on<SetMeridiemEvent>((event, emit )
  =>
  emit(state.copyWith(
    isMeridiem: !state.isMeridiem
  )));
  
on<InitEvent>( (event, emit) async {
  final res =  await _lcsg.loadPrefs();
  emit(state.copyWith(
    isDarkTheme: await res['isDark'],
    isMeridiem: await res['isAMPM'],
    selectedHour: await res['startTime'],
    selectedDay: await res['startDay']
  ));
});
  }

  
}