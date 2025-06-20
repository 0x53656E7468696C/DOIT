import 'package:doit/core/ui/theme.dart';
import 'package:doit/pages/home/view/home.dart';
import 'package:doit/pages/home/viewmod/bloc.dart';
import 'package:doit/pages/prefs/viewmod/pref_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (ctx) => PrefsBloc()
      
       ),
       BlocProvider(create: (ctx) => HomeBloc()),
    ], child: 
    const DOIT()
    
    ));
}
class DOIT extends StatelessWidget {
  const DOIT({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("widget rebuilds again on main");
    final isDarkTheme = context.select((PrefsBloc bloc) => bloc.state.isDarkTheme);
    return  MaterialApp(
      theme: isDarkTheme ? DOITThemeData.dark : DOITThemeData.lit ,
      scrollBehavior: const ScrollBehavior().copyWith(
        scrollbars: false,
      ),
      debugShowCheckedModeBanner: false,

      // home: const Home()
      home: const Home(),
    );
  }
}
