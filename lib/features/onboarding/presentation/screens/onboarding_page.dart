import 'package:bebop/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

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
        SizedBox(
          height: context.height * 0.45,
          width: double.infinity,
          child: Align(
            alignment: AlignmentDirectional.topCenter,
            child: CardsStack(
              pageNumber: number,
              lightCardChild: lightCardChild,
              darkCardChild: darkCardChild,
              lightCardOffsetAnimation: lightCardOffsetAnimation,
              darkCardOffsetAnimation: darkCardOffsetAnimation,
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: textColumn,
        ),
      ],
    );
  }
}
