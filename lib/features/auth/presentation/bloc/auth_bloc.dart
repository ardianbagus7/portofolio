import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fs;
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/base/bloc/base_bloc.dart';
import 'package:portofolio/core/base/bloc/event_bloc.dart';
import 'package:portofolio/core/base/bloc/state_bloc.dart';
import 'package:portofolio/core/usecases/usecase.dart';
import 'package:portofolio/features/auth/data/models/user_model.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';
import 'package:portofolio/features/auth/domain/repositories/auth_repository.dart';
import 'package:portofolio/features/auth/domain/usecases/check_signin.dart';
import 'package:portofolio/features/auth/domain/usecases/logout_user.dart';
import 'package:portofolio/features/auth/domain/usecases/signin_with_gogle.dart';
import 'package:portofolio/features/auth/domain/usecases/silent_signin_with_google.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final SigninWithGoogleUseCase signinWithGoogle;
  final LogoutUserUseCase logoutUser;
  final SiletSigninWithGoogleUseCase siletSigninWithGoogle;
  final CheckSignInUseCase checkSignIn;

  AuthBloc(
    this.signinWithGoogle,
    this.logoutUser,
    this.siletSigninWithGoogle,
    this.checkSignIn,
  ) : super(AuthInitialState()) {
    on<SilentSignInWithGoogleEvent>(
        (event, emit) => _silentSigninWithGoogle(emit));
    on<SignInWithGoogleEvent>((event, emit) => _signInWithGoogle(emit));
    on<CheckSigninEvent>((event, emit) => _checkSignIn(emit));
    on<SignoutEvent>((event, emit) => _signOutAccount(emit));
  }

  void _silentSigninWithGoogle(Emitter<AuthState> emit) async {
    emit(AuthLoadingState(
      credential: state.currentCredential,
      user: state.currentUser,
    ));

    final _data = await siletSigninWithGoogle.call(NoParams());

    _data.fold(
      (l) => emit(AuthFailureState(
        message: "Auth Failure - ${l.toString()}",
        credential: state.currentCredential,
        user: state.currentUser,
      )),
      (r) => emit(UnregisteredState(
        message: "User Unregistered",
        credential: r,
        user: state.currentUser,
      )),
    );
  }

  void _signInWithGoogle(Emitter<AuthState> emit) async {
    emit(AuthLoadingState(
      credential: state.currentCredential,
      user: state.currentUser,
    ));

    final _data = await signinWithGoogle.call(NoParams());

    _data.fold(
      (l) => emit(AuthFailureState(
        message: "Auth Failure - ${l.toString()}",
        credential: state.currentCredential,
        user: state.currentUser,
      )),
      (r) => emit(UnregisteredState(
        message: "User Unregistered",
        credential: r,
        user: state.currentUser,
      )),
    );
  }

  void _checkSignIn(Emitter<AuthState> emit) async {
    // emit(const AuthState.isLoading());
    // final _data = await authRepository.checkSignIn();

    // _data.fold(
    //   (l) => emit(AuthState.onError(l.toString())),
    //   (r) => emit(AuthState.aunthenticated(r)),
    // );
  }

  void _signOutAccount(Emitter<AuthState> emit) async {
    emit(AuthLoadingState(
      credential: state.currentCredential,
      user: state.currentUser,
    ));

    final _data = await logoutUser.call(NoParams());
    _data.fold(
      (l) => emit(AuthFailureState(
        message: "Auth Failure - ${l.toString()}",
        credential: state.currentCredential,
        user: state.currentUser,
      )),
      (r) => emit(UnAuthenticatedState(
        message: "Signout Success",
        credential: null,
        user: null,
      )),
    );
  }
}
