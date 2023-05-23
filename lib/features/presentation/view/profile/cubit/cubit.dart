import 'package:bebop/features/presentation/view/profile/cubit/profile_mixin.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/auth/signout_usecase.dart';
import '../../../../domain/usecases/user/get_current_user_usecase.dart';
import 'states.dart';

class ProfileCubit extends Cubit<ProfileStates> with ProfileMixin {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignOutUseCase _signOutUseCase;

  ProfileCubit(this._signOutUseCase, this._getCurrentUserUseCase)
      : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  UserEntity? userEntity;

  Future<void> getCurrentUser() async {
    emit(GetCurrentUserLoadingState());
    final result = await _getCurrentUserUseCase(NoParams());

    result.fold(
      (l) => emit(GetCurrentUserErrorState()),
      (r) {
        userEntity = r;
        emit(GetCurrentUserSuccessState());
      },
    );
  }

  Future<void> signOut() async {
    emit(SignOutLoadingState());
    final result = await _signOutUseCase(NoParams()).catchError((e) {
      if (e is FirebaseAuthException) {
        AppDialogs.showToast(msg: e.message.toString());
        return Left(ServerFailure(e.message.toString()));
      }
      return Left(ServerFailure(e.message.toString()));
    });
    result.fold(
      (l) => emit(SignOutErrorState()),
      (r) => emit(SignOutSuccessState()),
    );
  }
}
