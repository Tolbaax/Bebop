import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class CryingCubit extends Cubit<CryingStates> {
  CryingCubit() : super(CryingIntialState());

  static CryingCubit get(context) => BlocProvider.of(context);
}
