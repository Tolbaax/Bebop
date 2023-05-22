import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../crying/screens/crying_screen.dart';
import '../../home/screens/home_screen.dart';
import '../../profile/screens/profile_screen.dart';
import '../../tracking/screens/tracking_screen.dart';
import 'states.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialSate());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const CryingScreen(),
    const TrackingScreen(),
    const ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavState());
  }

  Future<bool> onWillPop() async {
    if (selectedIndex != 0) {
      selectedIndex = 0;
      emit(OnWillPopState());
      return false;
    }
    return true;
  }
}
