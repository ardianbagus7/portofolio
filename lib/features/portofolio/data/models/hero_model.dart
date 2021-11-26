import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portofolio/features/portofolio/data/models/social_media_model.dart';
import 'package:portofolio/features/portofolio/domain/entities/hero.dart';

class HeroModel extends Hero {
  HeroModel({
    required String id,
    String imageUrl = "",
    String title = "",
    String firstName = "",
    String lastName = "",
    List<String> roles = const [],
    List<SocialMediaModel> socialMediaList = const [],
    String? template = "",
  }) : super(
          id: id,
          imageUrl: imageUrl,
          title: title,
          firstName: firstName,
          lastName: lastName,
          roles: roles,
          socialMediaList: socialMediaList,
          template: template,
        );

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: (json['id'] is String) ? json['id'] : "",
      imageUrl: (json['imageUrl'] is String) ? json['imageUrl'] : "",
      title: (json['title'] is String) ? json['title'] : "",
      firstName: (json['firstName'] is String) ? json['firstName'] : "",
      lastName: (json['lastName'] is String) ? json['lastName'] : "",
      roles: (json['roles'] is List)
          ? List.from(json['roles']).toList().cast<String>()
          : <String>[],
      socialMediaList: (json['socialMediaList'] is List<Map>)
          ? List.from(json['socialMediaList'])
              .map((e) => SocialMediaModel.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'roles': roles.map((e) => e).toList(),
      'socialMediaList':
          (socialMediaList as List<SocialMediaModel>).map((e) => e.toJson()),
    };
  }
}
