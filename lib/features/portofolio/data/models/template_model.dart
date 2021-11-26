import 'package:portofolio/features/portofolio/domain/entities/template.dart';

class TemplateModel extends Template {
  TemplateModel({
    required String id,
    required String templateId,
    Map<String, dynamic> meta = const {},
  }) : super(
          id: id,
          templateId: templateId,
          meta: meta,
        );

  TemplateModel copyWith({
    String? id,
    String? templateId,
    Map<String, dynamic>? meta,
  }) =>
      TemplateModel(
        id: id ?? this.id,
        templateId: templateId ?? this.templateId,
        meta: meta ?? this.meta,
      );

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    
    return TemplateModel(
      id: (json['id'] is String) ? json['id'] : "",
      templateId: (json['templateId'] is String) ? json['templateId'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'templateId': templateId,
    };
  }
}
