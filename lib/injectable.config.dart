// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'core/helpers/firebase_injectable_module.dart' as _i21;
import 'core/theme/theme_service.dart' as _i10;
import 'features/auth/data/datasources/auth_remote_data_source.dart' as _i11;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i13;
import 'features/auth/domain/repositories/auth_repository.dart' as _i12;
import 'features/auth/domain/usecases/check_signin.dart' as _i14;
import 'features/auth/domain/usecases/logout_user.dart' as _i16;
import 'features/auth/domain/usecases/signin_with_gogle.dart' as _i18;
import 'features/auth/domain/usecases/silent_signin_with_google.dart' as _i19;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i20;
import 'features/portofolio/data/datasources/portofolio_remote_data_source.dart'
    as _i7;
import 'features/portofolio/data/repositories/portofolio_repository_impl.dart'
    as _i9;
import 'features/portofolio/domain/repositories/portofolio_repository.dart'
    as _i8;
import 'features/portofolio/domain/usecases/fetch_portofolio.dart' as _i15;
import 'features/portofolio/presentation/bloc/portofolio_bloc.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore);
  gh.lazySingleton<_i5.FirebaseStorage>(
      () => firebaseInjectableModule.fireStorage);
  gh.lazySingleton<_i6.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i7.PortofolioRemoteDataSource>(() =>
      _i7.PortofolioRemoteDataSourceImpl(
          get<_i4.FirebaseFirestore>(), get<_i5.FirebaseStorage>()));
  gh.lazySingleton<_i8.PortofolioRepository>(() =>
      _i9.PortofolioRepositoryImpl(get<_i7.PortofolioRemoteDataSource>()));
  gh.lazySingleton<_i10.ThemeService>(() => _i10.ThemeService());
  gh.lazySingleton<_i11.AuthRemoteDataSource>(() =>
      _i11.AuthRemoteDataSourceImpl(
          get<_i3.FirebaseAuth>(),
          get<_i6.GoogleSignIn>(),
          get<_i4.FirebaseFirestore>(),
          get<_i5.FirebaseStorage>()));
  gh.lazySingleton<_i12.AuthRepository>(
      () => _i13.AuthRepositoryImpl(get<_i11.AuthRemoteDataSource>()));
  gh.factory<_i14.CheckSignInUseCase>(
      () => _i14.CheckSignInUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i15.FetchPortofolioUseCase>(
      () => _i15.FetchPortofolioUseCase(get<_i8.PortofolioRepository>()));
  gh.factory<_i16.LogoutUserUseCase>(
      () => _i16.LogoutUserUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i17.PortofolioBloc>(
      () => _i17.PortofolioBloc(get<_i15.FetchPortofolioUseCase>()));
  gh.factory<_i18.SigninWithGoogleUseCase>(
      () => _i18.SigninWithGoogleUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i19.SiletSigninWithGoogleUseCase>(
      () => _i19.SiletSigninWithGoogleUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i20.AuthBloc>(() => _i20.AuthBloc(
      get<_i18.SigninWithGoogleUseCase>(),
      get<_i16.LogoutUserUseCase>(),
      get<_i19.SiletSigninWithGoogleUseCase>(),
      get<_i14.CheckSignInUseCase>()));
  return get;
}

class _$FirebaseInjectableModule extends _i21.FirebaseInjectableModule {}
