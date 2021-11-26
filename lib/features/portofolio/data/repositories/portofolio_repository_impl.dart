import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/exceptions.dart';
import 'package:portofolio/core/error/failures.dart';
import 'package:portofolio/features/portofolio/data/datasources/portofolio_remote_data_source.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';
import 'package:portofolio/features/portofolio/domain/repositories/portofolio_repository.dart';

@LazySingleton(as: PortofolioRepository)
class PortofolioRepositoryImpl implements PortofolioRepository {
  final PortofolioRemoteDataSource portofolioRemoteDataSource;

  PortofolioRepositoryImpl(this.portofolioRemoteDataSource);

  @override
  Future<Either<Failure, PortofolioModel>> fetchPortofolio(
      String userId, String locale) async {
    try {
      final result =
          await portofolioRemoteDataSource.fetchPortofolio(userId, locale);
      return Right(result);
    } on DocumentNotExistException catch (e) {
      return Left(DocumentNotExistFailure(e.message));
    } on ServerException {
      return const Left(ServerFailure(""));
    } catch (e, s) {
      debugPrint("checkSignIn $e $s");
      return Left(ServerFailure("$e"));
    }
  }
}
