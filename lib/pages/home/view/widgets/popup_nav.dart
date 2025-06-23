import 'package:doit/core/ui/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopupNav extends StatelessWidget {
  final String data;
  final double size;
  final IconData ico;
  const PopupNav({ super.key, required this.data, this.size = 20.1, required this.ico});

  @override
  Widget build(BuildContext context) {
  final _con = Theme.of(context).textTheme;
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: EdgeInsets.all(21),
                          height: 24,
                          width: 33,
                          decoration: BoxDecoration(
                            color: DOITColors.pinkish,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "-",
                              style: Theme.of(
                                context,
                              ).textTheme.titleLarge!.copyWith(fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 6.0),
                        child: Row(
                          children: [
                            Icon(ico, size: size, )
                        ,
                                                  Padding(
                                                                            padding: const EdgeInsets.only(top : 3),

                                                    child: Text(" $data     ", style: _con.titleSmall!.copyWith(
                                                                                                    color: _con.titleLarge!.color!.withAlpha(180),
                                                                                                    )),
                                                  ),
                          ],
                        ),
                      )
                    ],
                  );
              
  }
}