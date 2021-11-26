import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fs;
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/exceptions.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:portofolio/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';
import 'package:portofolio/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> checkSignIn() async {
    try {
      final result = await authRemoteDataSource.checkSignin();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } catch (e, s) {
      debugPrint("checkSignIn $e $s");
      return Left(ServerFailure("$e"));
    }
  }

  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> logoutUser() async {
    try {
      final result = await authRemoteDataSource.logoutUser();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } catch (e, s) {
      debugPrint("checkSignIn $e $s");
      return Left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, fs.UserCredential>> signinWithGoogle() async {
    try {
      final result = await authRemoteDataSource.signinWithGoogle();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } catch (e, s) {
      debugPrint("checkSignIn $e $s");
      return Left(ServerFailure("$e"));
    }
  }

  @override
  Future<Either<Failure, fs.UserCredential>> silentSigninWithGoogle() async {
    try {
      final result = await authRemoteDataSource.silentSigninWithGoogle();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(""));
    } catch (e, s) {
      debugPrint("checkSignIn $e $s");
      return Left(ServerFailure("$e"));
    }
  }
}
