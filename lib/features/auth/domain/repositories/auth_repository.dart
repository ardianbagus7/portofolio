import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fs;
import 'package:portofolio/core/error/failures.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, fs.UserCredential>> signinWithGoogle();
  Future<Either<Failure, fs.UserCredential>> silentSigninWithGoogle();
  Future<Either<Failure, bool>> checkSignIn();
  Future<Either<Failure, bool>> logoutUser();
}
