part of 'pref_bloc.dart';

sealed class PrefEvent{}

class SetThemeEvent extends PrefEvent{
  final bool? value;
  SetThemeEvent({required this.value});
}
class SetDDayEvent extends PrefEvent{
  final int? dayIndex;
  SetDDayEvent(this.dayIndex);
}
class SetDHourEvent extends PrefEvent{
  final int? hourIndex;
  SetDHourEvent(this.hourIndex);
}
class SetMeridiemEvent extends PrefEvent{}
class SetLangEvent extends PrefEvent{}
class ExportEvent extends PrefEvent{}
class ImportEvent extends PrefEvent{}

class InitEvent extends PrefEvent{}