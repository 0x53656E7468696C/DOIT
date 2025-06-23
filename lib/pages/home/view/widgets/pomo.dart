
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/view/widgets/clock.dart';
import 'package:doit/pages/home/view/widgets/popup_nav.dart';
import 'package:flutter/cupertino.dart';

class DOITPomo extends StatelessWidget {
  const DOITPomo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: DOITCard(
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                const PopupNav(data: "Pomo", ico : CupertinoIcons.alarm ),
                const DOITPomoClock(),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      hitTestBehavior: HitTestBehavior.translucent,
                      children: [
                        

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
