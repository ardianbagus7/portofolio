import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portofolio/core/usecases/usecase.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';
import 'package:portofolio/features/auth/domain/repositories/auth_repository.dart';

@injectable
class CheckSignInUseCase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  CheckSignInUseCase(this.authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.checkSignIn();
  }
}
