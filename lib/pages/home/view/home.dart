import 'package:doit/pages/home/view/desktop_view.dart';
import 'package:doit/pages/home/view/mobile_view.dart';
import 'package:doit/pages/home/view/widgets/appbar.dart';
import 'package:doit/pages/home/view/widgets/bottom_bar.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:doit/pages/web/webview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("widget rebuilds again on Scaf home");
    bool isMobileView = context.select((HomeBloc bloc) => bloc.state.isMobileView);
    return Scaffold(
      body: 
      switch(defaultTargetPlatform){
        TargetPlatform.android => const MobileView(),
         _ => const MobileView() // DOITWeb()
        // ( isMobileView ? const MobileView() :  const DesktopView())
        
          } 
    ,
    );
  }
}

