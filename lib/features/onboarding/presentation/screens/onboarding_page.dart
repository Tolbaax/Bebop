import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/cards_stack.dart';

class OnBoardingPage extends StatelessWidget {
  final int number;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;
  final Widget textColumn;

  const OnBoardingPage({
    super.key,
    required this.number,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CardsStack(
          pageNumber: number,
          lightCardChild: lightCardChild,
          darkCardChild: darkCardChild,
          lightCardOffsetAnimation: lightCardOffsetAnimation,
          darkCardOffsetAnimation: darkCardOffsetAnimation,
        ),
        SizedBox(height: number % 2 == 1 ? 6.1.h : 3.h),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: textColumn,
        ),
      ],
    );
  }
}
