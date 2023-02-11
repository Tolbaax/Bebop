import 'package:bebop/features/profile/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileIntialState());

  static ProfileCubit get(context) => BlocProvider.of(context);
}
