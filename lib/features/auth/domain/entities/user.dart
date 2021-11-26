// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'user.freezed.dart';

class User {
  final String id;
  final num? nrp;
  final String email;
  final String name;
  final String role;
  final String status;
  final num? angkatan;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    this.nrp,
    required this.email,
    required this.name,
    required this.role,
    required this.status,
    this.angkatan,
    this.createdAt,
    this.updatedAt,
  });
}

// @freezed
// class User with _$User {
//   factory User({
//     required String id,
//     String? nrp,
//     required String email,
//     required String name,
//     required String role,
//     required String status,
//     String? angkatan,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//   }) = _User;
// }
