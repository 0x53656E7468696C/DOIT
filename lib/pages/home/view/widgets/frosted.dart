import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlass extends StatelessWidget {
  const FrostedGlass({super.key});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: const FractionalOffset(0, 0.042),
      child: ClipRect(
        child: ColoredBox(
          color:  const Color.fromARGB(30, 0, 0, 0),
          child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45), child:
           const SizedBox(
            height: 96,
            child: FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 0.12,
                      ),
          ),),
        ),
      ),
    );
  }
}