import 'package:doit/pages/home/view/widgets/btns.dart';
import 'package:doit/pages/home/view/widgets/calender.dart';
import 'package:doit/pages/home/view/widgets/card.dart';
import 'package:doit/pages/home/view/widgets/popup_nav.dart';
import 'package:doit/pages/home/view/widgets/todo_mob.dart';
import 'package:flutter/cupertino.dart';

class DOITGoalPage extends StatelessWidget {
  const DOITGoalPage({super.key});

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
                const PopupNav(data: "Goal", ico : CupertinoIcons.calendar_today ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      hitTestBehavior: HitTestBehavior.translucent,
                      children: [
                       const DOITCalender(),
                       
                       const GoalList()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.08),
          child: DOITAddBtn(isGoal: true,)
          ),
      ],
    );
  }
}
