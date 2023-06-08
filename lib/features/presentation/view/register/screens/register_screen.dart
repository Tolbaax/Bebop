import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/services/injection_container.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../components/custom_clippers/blue_top_clipper.dart';
import '../../../components/custom_clippers/grey_top_clipper.dart';
import '../../../components/custom_clippers/white_top_clipper.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_states.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

class RegisterScreen extends StatefulWidget {
  final double screenHeight;

  const RegisterScreen({super.key, required this.screenHeight});

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late final RegisterCubit _cubit;
  late final AnimationController _animationController;
  late final Animation<double> _whiteTopClipperAnimation;
  late final Animation<double> _blueTopClipperAnimation;
  late final Animation<double> _greyTopClipperAnimation;

  late final AnimationController _inputFiledAnimationController;
  late Animation<Offset> _slideAnimationNameFiled;
  late Animation<Offset> _slideAnimationConfirmPassFiled;

  @override
  void initState() {
    super.initState();

    _cubit = RegisterCubit(sl());

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 0),
    );

    final clipperOffsetTween =
        Tween<double>(begin: widget.screenHeight, end: 0.0);
    _blueTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.7, curve: Curves.easeInOut),
      ),
    );
    _greyTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.35, 0.7, curve: Curves.easeInOut),
      ),
    );
    _whiteTopClipperAnimation = clipperOffsetTween.animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.7, curve: Curves.easeInOut),
      ),
    );

    _animationController.forward();

    _inputFiledAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );

    _inputFiledAnimationController.forward();
    _setCardsSlideInAnimation();
  }

  @override
  void dispose() {
    _cubit.close();
    _animationController.dispose();
    _inputFiledAnimationController.dispose();
    super.dispose();
  }

  void _setCardsSlideInAnimation() {
    setState(() {
      _slideAnimationNameFiled = Tween<Offset>(
        begin: const Offset(3.0, .0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _inputFiledAnimationController,
          curve: Curves.easeIn,
        ),
      );

      _slideAnimationConfirmPassFiled = Tween<Offset>(
        begin: const Offset(3.0, 0.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _inputFiledAnimationController,
          curve: Curves.easeIn,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 34.h,
                      ),
                      RegisterForm(
                        nameOffsetAnimation: _slideAnimationNameFiled,
                        confirmPassOffsetAnimation:
                            _slideAnimationConfirmPassFiled,
                        cubit: _cubit,
                      ),
                    ],
                  ),
                ),
                AnimatedBuilder(
                  animation: _whiteTopClipperAnimation,
                  builder: (_, Widget? child) {
                    return ClipPath(
                      clipper: WhiteTopClipper(
                        yOffset: _whiteTopClipperAnimation.value,
                      ),
                      child: child,
                    );
                  },
                  child: Container(color: AppColors.grey),
                ),
                AnimatedBuilder(
                  animation: _greyTopClipperAnimation,
                  builder: (_, Widget? child) {
                    return ClipPath(
                      clipper: GreyTopClipper(
                        yOffset: _greyTopClipperAnimation.value,
                      ),
                      child: child,
                    );
                  },
                  child: Container(color: AppColors.primary),
                ),
                AnimatedBuilder(
                  animation: _blueTopClipperAnimation,
                  builder: (_, Widget? child) {
                    return ClipPath(
                      clipper: BlueTopClipper(
                        yOffset: _blueTopClipperAnimation.value,
                      ),
                      child: child,
                    );
                  },
                  child: Container(color: AppColors.white),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(top: 4.0.h),
                    child: const RegisterHeader(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
