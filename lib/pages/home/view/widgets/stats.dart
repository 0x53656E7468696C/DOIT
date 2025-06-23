
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/view/widgets/popup_nav.dart';
import 'package:flutter/cupertino.dart';

class DOITStats extends StatelessWidget {
  const DOITStats({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          child: DOITCard(
            child: SizedBox(
              height: 500,
              child: Column(
                children: [
                PopupNav(data: "Stats", ico : CupertinoIcons.chart_bar_circle ),
                  Center(
                    child: 
                    Text("Planning ...", )
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
