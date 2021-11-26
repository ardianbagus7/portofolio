part of 'auth_bloc.dart';

class AuthEvent extends EventBloc {
  @override
  List<Object?> get props => [];
}

class SilentSignInWithGoogleEvent extends AuthEvent {}

class SignInWithGoogleEvent extends AuthEvent {}

class CheckSigninEvent extends AuthEvent {}

class SignoutEvent extends AuthEvent {}
