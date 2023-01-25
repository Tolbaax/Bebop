import 'package:bebop/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CardsStack extends StatelessWidget {
  final int pageNumber;
  final Widget lightCardChild;
  final Widget darkCardChild;
  final Animation<Offset> lightCardOffsetAnimation;
  final Animation<Offset> darkCardOffsetAnimation;

  const CardsStack({
    super.key,
    required this.pageNumber,
    required this.lightCardChild,
    required this.darkCardChild,
    required this.lightCardOffsetAnimation,
    required this.darkCardOffsetAnimation,
  });

  bool get isOddPageNumber => pageNumber % 2 == 1;

  @override
  Widget build(BuildContext context) {
    final darkCardWidth = MediaQuery.of(context).size.width - 2 * 32.0;
    final darkCardHeight = MediaQuery.of(context).size.height / 3;

    return Padding(
      padding: EdgeInsets.only(top: isOddPageNumber ? 25.0 : 50.0),
      child: Stack(
        alignment: AlignmentDirectional.center,
        clipBehavior: Clip.none,
        children: <Widget>[
          SlideTransition(
            position: darkCardOffsetAnimation,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: AppColors.darkBlue,
              child: Container(
                width: darkCardWidth,
                height: darkCardHeight,
                padding: EdgeInsets.only(
                  top: !isOddPageNumber ? 100.0 : 0.0,
                  bottom: isOddPageNumber ? 100.0 : 0.0,
                ),
                child: Center(child: darkCardChild),
              ),
            ),
          ),
          Positioned(
            top: !isOddPageNumber ? -25.0 : null,
            bottom: isOddPageNumber ? -25.0 : null,
            child: SlideTransition(
              position: lightCardOffsetAnimation,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                color: AppColors.lightBlue,
                child: Container(
                  width: darkCardWidth * 0.8,
                  height: darkCardHeight * 0.5,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Center(child: lightCardChild),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
