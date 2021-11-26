import 'package:portofolio/features/portofolio/data/models/template_model.dart';
import 'package:portofolio/features/portofolio/domain/entities/portofolio.dart';

class PortofolioModel extends Portofolio {
  PortofolioModel({
    List<TemplateModel> templates = const [],
  }) : super(
          templates: templates,
        );

  PortofolioModel copyWith({
    List<TemplateModel>? templates,
  }) =>
      PortofolioModel(
        templates: templates ?? (this.templates as List<TemplateModel>),
      );

  factory PortofolioModel.fromJson(Map<String, dynamic> json) {
    return PortofolioModel(
      templates: (json['templates'] is List)
          ? List.from(json['templates'])
              .map((e) => TemplateModel.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'templates': (templates as List<TemplateModel>).map((e) => e.toJson()),
    };
  }
}
