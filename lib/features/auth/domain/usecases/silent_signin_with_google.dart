import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portofolio/core/usecases/usecase.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';
import 'package:portofolio/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SiletSigninWithGoogleUseCase implements UseCase<UserCredential, NoParams> {
  final AuthRepository authRepository;

  SiletSigninWithGoogleUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) async {
    return await authRepository.silentSigninWithGoogle();
  }
}
