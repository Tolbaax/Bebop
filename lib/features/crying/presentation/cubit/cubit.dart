import 'package:bebop/features/crying/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryingCubit extends Cubit<CryingStates> {
  CryingCubit() : super(CryingIntialState());

  static CryingCubit get(context) => BlocProvider.of(context);
}
