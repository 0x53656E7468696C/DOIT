// import 'package:flutter/material.dart';


// class DOITCard{
//   static final Card card = ({required final Widget child, final Color? color, final Color?shadowColor, final Color? surfaceTintColor,final Color? borderColor , final double? elevation, }){
//     return Card(
//       child: child,
//     );
  
// } as Card;
// }


// //   class DOITCard extends StatelessWidget {
// //   const DOITCard({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Card();
// //   }
// // }




import 'package:flutter/material.dart';

class DOITCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Color? borderColor;
  final double? elevation;

  const DOITCard({
    Key? key,
    required this.child,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.borderColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,  
      shape: Theme.of(context).cardTheme.shape,
          child: child,
    );
  }
}