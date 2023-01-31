import 'package:bebop/features/login/presentation/cubit/login_cubit.dart';
import 'package:bebop/features/login/presentation/cubit/login_states.dart';
import 'package:bebop/features/login/presentation/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/app_color.dart';
import '../../../../core/widgets/custom_clippers/blue_top_clipper.dart';
import '../../../../core/widgets/custom_clippers/grey_top_clipper.dart';
import '../../../../core/widgets/custom_clippers/white_top_clipper.dart';
import '../../../../injection_container.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  final double screenHeight;

  const LoginScreen({super.key, required this.screenHeight});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _headerTextAnimation;
  late final Animation<double> _formElementAnimation;
  late final Animation<double> _whiteTopClipperAnimation;
  late final Animation<double> _blueTopClipperAnimation;
  late final Animation<double> _greyTopClipperAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2350),
    );

    final fadeSlideTween = Tween<double>(begin: 0.0, end: 1.0);
    _headerTextAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeInOut),
    ));
    _formElementAnimation = fadeSlideTween.animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0, curve: Curves.easeInOut),
    ));

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.white,
            body: Stack(
              children: <Widget>[
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
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(top: 4.0.h),
                      child: Column(
                        children: [
                          LoginHeader(animation: _headerTextAnimation),
                          SizedBox(
                            height: 21.20.h,
                          ),
                          LoginForm(animation: _formElementAnimation),
                        ],
                      ),
                    ),
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
