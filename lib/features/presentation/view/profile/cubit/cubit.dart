import 'package:bebop/core/params/baby_params.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/functions/app_dialogs.dart';
import '../../../../../core/usecases/usecase.dart';
import '../../../../domain/usecases/auth/signout_usecase.dart';
import '../../../../domain/usecases/user/get_current_user_usecase.dart';
import '../../../../domain/usecases/user/update_baby_info_usecase.dart';
import 'profile_mixin.dart';
import 'states.dart';

class ProfileCubit extends Cubit<ProfileStates> with ProfileMixin {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignOutUseCase _signOutUseCase;
  final UpdateBabyInfoUseCase _updateBabyInfoUseCase;

  ProfileCubit(
    this._signOutUseCase,
    this._getCurrentUserUseCase,
    this._updateBabyInfoUseCase,
  ) : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

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

  Future<void> updateBabyInfo(BabyParams params) async {
    emit(UpdateBabyInfoLoadingState());
    final result = await _updateBabyInfoUseCase(params).catchError((e) {
      if (e is FirebaseAuthException) {
        AppDialogs.showToast(msg: e.message.toString());
        return Left(ServerFailure(e.message.toString()));
      }
      AppDialogs.showToast(msg: e.message.toString());
      return Left(ServerFailure(e.message.toString()));
    });

    result.fold(
      (l) => emit(UpdateBabyInfoErrorState()),
      (r) => emit(UpdateBabyInfoSuccessState()),
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
