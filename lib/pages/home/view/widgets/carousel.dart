import 'package:doit/core/ui/colors.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:flutter/material.dart';

class CarouselCon extends StatefulWidget {
  const CarouselCon({super.key});

  @override
  State<CarouselCon> createState() => _CarouselConState();
}

class _CarouselConState extends State<CarouselCon> {
  late final CarouselController _ctrl;
  double _carouselint = 0;
  double _aniint = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = CarouselController();
    _carouselTimer();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

 void _carouselTimer(){
  for(_carouselint; _carouselint < 3; _carouselint++) {
    setState(() {
      _carouselint =1;
    });
    Future.delayed(Duration(seconds: 2),(){
     _ctrl.jumpTo(_carouselint);
     for(_aniint; _aniint < 11; _aniint++){
      setState(() {
        _aniint = _aniint;
      });
     }
  });
  }
 }
//  void _aniTimer(){
//     while (_aniint < 11 && _carouselint < 4) {
//       Future.delayed(Duration(milliseconds: 200),(){
//       _aniint++;
//       if(_aniint == 10) _aniint = 0 ;
//     });
//     }

//  }



  @override
  Widget build(BuildContext context) {
    
  return 
  Center(
    child: SizedBox(
        height: 120,
        width: 300,
        child: CarouselView(
          controller: _ctrl,
            padding: EdgeInsets.symmetric(horizontal: 0),
            elevation: 4.0,
            shape:  ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(51),
            side: const BorderSide(
              color: DOITColors.cardBorderLit,
              strokeAlign: BorderSide.strokeAlignOutside
            )
          ),
            
            itemSnapping: true,
            scrollDirection: Axis.horizontal,
            itemExtent: 300,
            children: [
                DOITCard(
                    color: Colors.red,
                    child: Center(child: AnimatedContainer(duration: Duration(seconds: 3),
                   width: _aniint, height: 3, color: Colors.white,

                    )),
                ),
                DOITCard(
                    color: Colors.green,
                    child: Center(child: Text('Item 2')),
                ),
                DOITCard(
                    color: Colors.blue,
                    child: Center(child: Text('Item 3')),
                ),
            ],
        ),
    ),
);
  }
}