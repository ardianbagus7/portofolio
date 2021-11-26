import 'social_media.dart';

class Hero {
  final String id;
  final String imageUrl;
  final String title;
  final String firstName;
  final String lastName;
  final List<String> roles;
  final List<SocialMedia> socialMediaList;
  final String? template;

  Hero({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.roles,
    required this.socialMediaList,
    required this.template,
  });
}
