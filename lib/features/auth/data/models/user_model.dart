import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portofolio/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required String id,
    num? nrp,
    required String email,
    required String name,
    required String role,
    required String status,
    num? angkatan,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          nrp: nrp,
          email: email,
          name: name,
          role: role,
          status: status,
          angkatan: angkatan,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  static String userRole = "User";
  static String adminRole = "Admin";
  bool isAdmin() => role == adminRole;

  static String mahasiswaStatus = "Mahasiswa";
  static String alumniStatus = "Alumni";
  static String dosenStatus = "Dosen";
  static List<String> statusList = [
    mahasiswaStatus,
    alumniStatus,
    dosenStatus,
  ];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['nrp'] is String) ? json['id'] : "",
      nrp: (json['nrp'] is num) ? json['nrp'] : null,
      email: (json['email'] is String) ? json['email'] : "",
      name: (json['name'] is String) ? json['name'] : "",
      role: (json['role'] is String) ? json['role'] : "",
      status: (json['status'] is String) ? json['status'] : "",
      angkatan: (json['angkatan'] is num) ? json['angkatan'] : null,
      createdAt: (json['createdAt'] is Timestamp)
          ? (json['createdAt'] as Timestamp).toDate()
          : (json['createdAt'] is DateTime)
              ? json['createdAt']
              : null,
      updatedAt: (json['updatedAt'] is Timestamp)
          ? (json['updatedAt'] as Timestamp).toDate()
          : (json['updatedAt'] is DateTime)
              ? json['updatedAt']
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nrp': nrp,
      'email': email,
      'name': name,
      'role': role,
      'status': status,
      'angkatan': angkatan,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
