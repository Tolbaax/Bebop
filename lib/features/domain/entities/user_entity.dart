import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;

  final String babyName;
  final String gender;
  final String birthDate;
  final String relationship;
  final String profilePic;
  final double babyHeight;
  final double babyWeight;

  const UserEntity({
    required this.name,
    required this.email,
    required this.babyName,
    required this.gender,
    required this.birthDate,
    required this.relationship,
    required this.profilePic,
    required this.babyHeight,
    required this.babyWeight,
  });

  @override
  List<Object> get props => [
        name,
        email,
        babyName,
        gender,
        birthDate,
        relationship,
        profilePic,
        babyHeight,
        babyWeight,
      ];
}
