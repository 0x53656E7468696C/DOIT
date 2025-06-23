import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Responsive extends StatelessWidget {
  const Responsive({super.key});

  @override
  Widget build(BuildContext context) {
        debugPrint("widget rebuilds again on res");

    final double _size = MediaQuery.sizeOf(context).width;
    context.read<HomeBloc>().add(SwitchView(_size));
    return const SizedBox();
  }
}