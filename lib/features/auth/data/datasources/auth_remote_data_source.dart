import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fs;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/exceptions.dart';
import 'package:portofolio/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<fs.UserCredential> signinWithGoogle();
  Future<fs.UserCredential> silentSigninWithGoogle();
  Future<UserModel> getUserData();
  Future<UserModel> setUserData();
  Future<bool> checkSignin();
  Future<bool> logoutUser();
  Future<Option<fs.User>> getSignedInUser();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final fs.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FirebaseStorage _fireStorage;

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._googleSignIn,
      this._firestore, this._fireStorage);

  @override
  Future<Option<fs.User>> getSignedInUser() async {
    return optionOf(_firebaseAuth.currentUser);
  }

  @override
  Future<fs.UserCredential> signinWithGoogle() async {
    try {
      //! Google Signin
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw AuthCancelledByUserException();
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = fs.GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      final _userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);

      return _userCredential;
    } on fs.FirebaseAuthException catch (e) {
      debugPrint("checkSignin ${e.toString()}");
      throw ServerException("${e.code} - ${e.message}");
    } catch (e, s) {
      debugPrint("checkSignin ${e.toString()} $s");
      throw ServerException("${e.toString}");
    }
  }

  @override
  Future<bool> checkSignin() async {
    try {
      final _isSignIn = await _googleSignIn.isSignedIn();
      return _isSignIn;
    } catch (e, s) {
      debugPrint("checkSignin ${e.toString()} $s");
      throw ServerException("${e.toString}");
    }
  }

  @override
  Future<bool> logoutUser() async {
    try {
      await _googleSignIn.signOut();
      return true;
    } on fs.FirebaseAuthException catch (e) {
      debugPrint("checkSignin ${e.toString()}");
      throw ServerException("${e.code} - ${e.message}");
    } catch (e, s) {
      debugPrint("checkSignin ${e.toString()} $s");
      throw ServerException("${e.toString}");
    }
  }

  @override
  Future<UserModel> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<UserModel> setUserData() {
    // TODO: implement setUserData
    throw UnimplementedError();
  }

  @override
  Future<fs.UserCredential> silentSigninWithGoogle() async {
    try {
      //! Google Signin
      final googleUser = await _googleSignIn.signInSilently();
      if (googleUser == null) {
        throw AuthCancelledByUserException();
      }

      final googleAuthentication = await googleUser.authentication;

      final authCredential = fs.GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      final _userCredential =
          await _firebaseAuth.signInWithCredential(authCredential);

      return _userCredential;
    } on fs.FirebaseAuthException catch (e) {
      debugPrint("checkSignin ${e.toString()}");
      throw ServerException("${e.code} - ${e.message}");
    } catch (e, s) {
      debugPrint("checkSignin ${e.toString()} $s");
      throw ServerException("${e.toString}");
    }
  }
}
