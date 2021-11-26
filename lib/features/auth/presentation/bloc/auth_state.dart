part of 'auth_bloc.dart';

class AuthState extends StateBloc {
  final fs.UserCredential? currentCredential;
  final UserModel? currentUser;

  AuthState({required this.currentCredential, required this.currentUser});

  @override
  List<Object?> get props => [currentCredential, currentUser];
}

class AuthInitialState extends AuthState {
  AuthInitialState() : super(currentCredential: null, currentUser: null);
}

class AuthLoadingState extends AuthState {
  final fs.UserCredential? credential;
  final UserModel? user;
  AuthLoadingState({
    required this.credential,
    required this.user,
  }) : super(
          currentCredential: credential,
          currentUser: user,
        );
}

class UnAuthenticatedState extends AuthState {
  final String message;
  final fs.UserCredential? credential;
  final UserModel? user;
  UnAuthenticatedState({
    required this.message,
    required this.credential,
    required this.user,
  }) : super(
          currentCredential: credential,
          currentUser: user,
        );
}

class UnregisteredState extends AuthState {
  final String message;
  final fs.UserCredential? credential;
  final UserModel? user;
  UnregisteredState({
    required this.message,
    required this.credential,
    required this.user,
  }) : super(
          currentCredential: credential,
          currentUser: user,
        );
}

class AuthenticatedState extends AuthState {
  final String message;
  final fs.UserCredential? credential;
  final UserModel? user;
  AuthenticatedState({
    required this.message,
    required this.credential,
    required this.user,
  }) : super(
          currentCredential: credential,
          currentUser: user,
        );
}

class AuthFailureState extends AuthState {
  final String message;
  final fs.UserCredential? credential;
  final UserModel? user;
  AuthFailureState({
    required this.message,
    required this.credential,
    required this.user,
  }) : super(
          currentCredential: credential,
          currentUser: user,
        );
}
