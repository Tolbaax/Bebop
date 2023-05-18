import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

class TrackingCubit extends Cubit<TrackingStates> {
  TrackingCubit() : super(TrackingIntialState());

  static TrackingCubit get(context) => BlocProvider.of(context);
}
