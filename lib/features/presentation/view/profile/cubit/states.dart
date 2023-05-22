abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class MemoryImagePickedSuccess extends ProfileStates {}

class AddMemorySuccess extends ProfileStates {}

class AddMemoryError extends ProfileStates {}

//Get CurrentUser States
class GetCurrentUserLoadingState extends ProfileStates {}

class GetCurrentUserErrorState extends ProfileStates {}

class GetCurrentUserSuccessState extends ProfileStates {}


//SignOut States
class SignOutLoadingState extends ProfileStates {}

class SignOutSuccessState extends ProfileStates {}

class SignOutErrorState extends ProfileStates {}
