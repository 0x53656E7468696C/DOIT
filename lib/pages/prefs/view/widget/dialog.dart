import 'package:doit/core/ui/colors.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:flutter/material.dart';

class DOITpopup extends StatelessWidget {
  final Widget widget;
  final VoidCallback func;
  final double width;
  final double height;
  const DOITpopup({super.key, required this.widget, required this.func, required this.width, required this.height });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DOITCard(
        child: SizedBox(
                            width: width,
                          height: width,
                            child: Stack(  
                              children: [
                                widget,
                                       Transform.translate(
                                    offset: Offset(9, 6),
                                    child: Container(
                                                            height: 24,
                                                            width: 33,
                                                            decoration: BoxDecoration(
                                                            color: DOITColors.pinkish,
                                                       borderRadius: BorderRadius.circular(10),
                                                       ),
                                                            child: GestureDetector(
                                                  onTap: (){
                                                    func;
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Center(
                                                    child: Text("-", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                                     fontSize: 22
                                                    ),),
                                                  )
                                                  ),
                                                    ),
                                  ),
                                
                              ],
                            ),
                          ),
      ),
    );
  }
}