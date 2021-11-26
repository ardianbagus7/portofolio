import 'package:portofolio/features/portofolio/domain/entities/social_media.dart';

class SocialMediaModel extends SocialMedia {
  SocialMediaModel({
    required String title,
    required String image,
    required String url,
  }) : super(title: title, image: image, url: url);

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) {
    return SocialMediaModel(
      title: (json['title'] is String) ? json['title'] : "",
      image: (json['image'] is String) ? json['image'] : "",
      url: (json['url'] is String) ? json['url'] : "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'url': url,
    };
  }
}
