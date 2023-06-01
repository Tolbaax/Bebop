import 'package:flutter_bloc/flutter_bloc.dart';

import 'reminder_mixin.dart';
import 'states.dart';

class ReminderCubit extends Cubit<ReminderStates> with ReminderMixin {
  ReminderCubit() : super(ReminderInitialState());

  static ReminderCubit get(context) => BlocProvider.of(context);
}
