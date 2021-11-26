import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:portofolio/core/usecases/usecase.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';
import 'package:portofolio/features/portofolio/domain/repositories/portofolio_repository.dart';

@injectable
class FetchPortofolioUseCase implements UseCase<PortofolioModel, Params> {
  final PortofolioRepository portofolioRepository;

  FetchPortofolioUseCase(this.portofolioRepository);

  @override
  Future<Either<Failure, PortofolioModel>> call(Params params) async {
    return await portofolioRepository.fetchPortofolio(
        params.userId, params.locale);
  }
}

class Params {
  final String userId;
  final String locale;

  Params({required this.userId, required this.locale});
}
