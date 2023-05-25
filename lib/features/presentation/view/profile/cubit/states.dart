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

//SignOut States
class SignOutLoadingState extends ProfileStates {}

class SignOutSuccessState extends ProfileStates {}

class SignOutErrorState extends ProfileStates {}

class SelectGenderSegmentState extends ProfileStates {}
