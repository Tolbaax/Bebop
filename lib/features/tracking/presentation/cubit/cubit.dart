import 'package:bebop/features/tracking/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingCubit extends Cubit<TrackingStates> {
  TrackingCubit() : super(TrackingIntialState());

  static TrackingCubit get(context) => BlocProvider.of(context);
}
