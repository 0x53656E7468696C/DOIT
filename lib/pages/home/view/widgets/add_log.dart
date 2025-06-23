import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DOITAddTimeLog extends StatelessWidget {
  const DOITAddTimeLog({super.key});

  @override
  Widget build(BuildContext context) {
     final DateTime _date = DateTime.now();
    return SizedBox(
      width: 100,
      height: 100,
      
      child: CupertinoDatePicker(initialDateTime: _date, minimumDate: DateTime(2000), maximumDate: DateTime(2038),  onDateTimeChanged: (_){HapticFeedback.vibrate();}, ));
  }
}