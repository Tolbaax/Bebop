import 'package:bebop/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.email,
    required super.babyName,
    required super.gender,
    required super.birthDate,
    required super.relationship,
    required super.profilePic,
    required super.babyHeight,
    required super.babyWeight,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        babyName: json['babyName'] ?? '',
        gender: json['gender'] ?? '',
        birthDate: json['birthDate'] ?? '',
        relationship: json['relationship'] ?? '',
        profilePic: json['profilePic'] ?? '',
        babyHeight: json['babyHeight'] ?? 0.0,
        babyWeight: json['babyWeight'] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'babyName': babyName,
        'gender': gender,
        'birthDate': birthDate,
        'relationship': relationship,
        'profilePic': profilePic,
        'babyHeight': babyHeight,
        'babyWeight': babyWeight,
      };
}
