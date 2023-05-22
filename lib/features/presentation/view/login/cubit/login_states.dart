abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeVisibilityState extends LoginStates {}


class LoginLoadingState extends LoginStates {}

class LoginSuccessfullyState extends LoginStates {}

class LoginErrorState extends LoginStates {}

class ClearSignInControllersState extends LoginStates {}
