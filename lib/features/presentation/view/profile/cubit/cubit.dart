import 'package:bebop/core/params/baby_params.dart';
import 'package:bebop/core/params/memory_params.dart';
import 'package:bebop/features/domain/entities/memory_entity.dart';
import 'package:bebop/features/domain/usecases/user/add_memory_usecase.dart';
import 'package:bebop/features/domain/usecases/user/delete_memory_usecase.dart';
import 'package:bebop/features/domain/usecases/user/get_memories_usecase.dart';
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
  final AddMemoryUseCase _addMemoryUseCase;
  final GetMemoriesUseCase _getMemoriesUseCase;
  final DeleteMemoryUseCase _deleteMemoryUseCase;

  ProfileCubit(
    this._signOutUseCase,
    this._getCurrentUserUseCase,
    this._updateBabyInfoUseCase,
    this._addMemoryUseCase,
    this._getMemoriesUseCase,
    this._deleteMemoryUseCase,
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
      AppDialogs.showToast(msg: e.message.toString());
      return Left(ServerFailure(e.message.toString()));
    });

    result.fold(
      (l) => emit(UpdateBabyInfoErrorState()),
      (r) => emit(UpdateBabyInfoSuccessState()),
    );
  }

  Future<void> addMemory() async {
    emit(AddMemoryLoadingState());
    final result = await _addMemoryUseCase.call(
      MemoryParams(
        imageFile: memoryImage,
        title: titleController.text.trim(),
        desc: descController.text.trim(),
      ),
    );

    result.fold(
      (l) => emit(AddMemoryErrorState()),
      (r) => emit(AddMemorySuccessState()),
    );
  }

  Future<List<MemoryEntity>> getMemories() async {
    final result = await _getMemoriesUseCase.call(NoParams());

    return result.fold(
      (failure) {
        emit(GetMemoriesErrorState(errorMessage: failure.toString()));
        return [];
      },
      (memories) {
        emit(GetMemoriesSuccessState(memories: memories));
        return memories;
      },
    );
  }

  Future<void> deleteMemory(String memoryId) async {
    emit(DeleteMemoryLoadingState());

    final result = await _deleteMemoryUseCase.call(memoryId);

    result.fold(
      (l) => emit(DeleteMemoryErrorState()),
      (r) => emit(DeleteMemorySuccessState()),
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
