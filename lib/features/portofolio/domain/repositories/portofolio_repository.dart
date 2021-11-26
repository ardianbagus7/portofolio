import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fs;
import 'package:portofolio/core/error/failures.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';

abstract class PortofolioRepository {
  Future<Either<Failure, PortofolioModel>> fetchPortofolio(String userId,String locale);
}
