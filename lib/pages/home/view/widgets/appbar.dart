import 'package:flutter/material.dart';

class DOITAppBar extends StatelessWidget {
  const DOITAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size(100, 86), child: ColoredBox(color: Colors.black),
    );
  }
}