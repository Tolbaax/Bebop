import '../../../../domain/entities/memory_entity.dart';

abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class MemoryImagePickedSuccess extends ProfileStates {}

class AddMemorySuccess extends ProfileStates {}

class AddMemoryError extends ProfileStates {}

//Get CurrentUser States
class GetCurrentUserLoadingState extends ProfileStates {}

class GetCurrentUserErrorState extends ProfileStates {}

class GetCurrentUserSuccessState extends ProfileStates {}

//Update Profile Pic
class UpdateProfilePicLoadingState extends ProfileStates {}

class UpdateProfilePicSuccessState extends ProfileStates {}

class UpdateProfilePicErrorState extends ProfileStates {}

class SelectProfileImageFromGalleryState extends ProfileStates {}

//Update Baby Info
class UpdateBabyInfoLoadingState extends ProfileStates {}

class UpdateBabyInfoSuccessState extends ProfileStates {}

class UpdateBabyInfoErrorState extends ProfileStates {}

//Add Memory
class AddMemoryLoadingState extends ProfileStates {}

class AddMemorySuccessState extends ProfileStates {}

class AddMemoryErrorState extends ProfileStates {}

class ClearMemoryContrllersState extends ProfileStates {}

//Get Memories
class GetMemoriesLoadingState extends ProfileStates {}

class GetMemoriesSuccessState extends ProfileStates {
  final List<MemoryEntity> memories;

  GetMemoriesSuccessState({required this.memories});
}

class GetMemoriesErrorState extends ProfileStates {
  final String errorMessage;

  GetMemoriesErrorState({required this.errorMessage});
}

//Delete Memory
class DeleteMemoryLoadingState extends ProfileStates {}

class DeleteMemorySuccessState extends ProfileStates {}

class DeleteMemoryErrorState extends ProfileStates {}

//SignOut States
class SignOutLoadingState extends ProfileStates {}

class SignOutSuccessState extends ProfileStates {}

class SignOutErrorState extends ProfileStates {}
