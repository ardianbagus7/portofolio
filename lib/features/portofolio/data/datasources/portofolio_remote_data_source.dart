import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:portofolio/core/error/exceptions.dart';
import 'package:portofolio/core/helpers/firestore_helpers.dart';
import 'package:portofolio/core/util/log.dart';
import 'package:portofolio/features/portofolio/data/models/portofolio_model.dart';
import 'package:portofolio/features/portofolio/data/models/template_model.dart';
import 'package:portofolio/features/portofolio/domain/entities/template.dart';

abstract class PortofolioRemoteDataSource {
  Future<PortofolioModel> fetchPortofolio(String userId, String locale);
}

@LazySingleton(as: PortofolioRemoteDataSource)
class PortofolioRemoteDataSourceImpl implements PortofolioRemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _fireStorage;

  PortofolioRemoteDataSourceImpl(this._firestore, this._fireStorage);

  @override
  Future<PortofolioModel> fetchPortofolio(String userId, String locale) async {
    try {
      //* Fetch Portofolio
      DocumentReference<Map<String, dynamic>> portofolioDoc =
          await _firestore.portofolioDocument(userId, locale);

      final portofolioMap = await portofolioDoc.get();

      Log.setLog("Start ${portofolioDoc.toString()} ${portofolioMap.exists}",
          log: "PortofolioRemoteDataSourceImpl.fetchPortofolio ==>");

      if (!portofolioMap.exists) {
        throw DocumentNotExistException("Portofolio is Not Exists");
      }

      PortofolioModel portofolio =
          PortofolioModel.fromJson(portofolioMap.data() ?? {});

      //* Fetch Templates Meta Data
      List<TemplateModel> templates = [];

      await Future.forEach(portofolio.templates, (Template template) async {
        DocumentReference<Map<String, dynamic>> templateDoc =
            await _firestore.templateDocument(userId, locale, template.id);

        final templateMap = await templateDoc.get();

        Log.setLog("${templateDoc.toString()} ${templateMap.exists}",
            log: "PortofolioRemoteDataSourceImpl.fetchPortofolio ==>");

        if (!templateMap.exists) {
          throw DocumentNotExistException("Portofolio is Not Exists");
        }

        TemplateModel finalTemplate =
            TemplateModel.fromJson(templateMap.data() ?? {});

        templates.add(finalTemplate);
      });

      portofolio = portofolio.copyWith(templates: templates);

      return portofolio;
    } on FirebaseException catch (e) {
      Log.setLog(e.toString(),
          log:
              "PortofolioRemoteDataSourceImpl.fetchPortofolio.FirebaseException ==>");
      throw ServerException("${e.toString}");
    }
  }
}
