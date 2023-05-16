import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_mixin.dart';
import 'register_states.dart';

class RegisterCubit extends Cubit<RegisterStates> with RegisterMixin {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
}
