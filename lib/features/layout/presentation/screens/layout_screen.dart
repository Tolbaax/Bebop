import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/custom_floating_button.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        final cubit = LayoutCubit.get(context);

        return WillPopScope(
          onWillPop: cubit.onWillPop,
          child: Scaffold(
            extendBody: true,
            floatingActionButton: const CustomFloatingButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: CustomBottomNavBar(cubit: cubit),
            body: cubit.screens[cubit.selectedIndex],
          ),
        );
      },
    );
  }
}
