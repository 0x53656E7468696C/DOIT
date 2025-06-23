import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DOITCalender extends StatelessWidget {
  final double height;
  final double width;
  final double offsetY;
  const DOITCalender({super.key, this.height = 240, this.width = 288, this.offsetY = -36});

  @override
  Widget build(BuildContext context) {
    final DateTime _date = DateTime.now();
    return 
    Transform.translate(
      offset:  Offset(0, offsetY),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: width,
            height: height,
            child: CalendarDatePicker(
              initialDate: _date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2038),
              onDateChanged: (_) => HapticFeedback.vibrate(),
              onDisplayedMonthChanged: (value) => context
                  .read<HomeBloc>()
                  .add(SetHomeMYEvent(m: value.month - 1, year: value.year)),
            ),
          ),
        ],
      ),
    );
  }
}