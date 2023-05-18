import 'package:equatable/equatable.dart';

class SignUpParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String babyName;
  final String gender;
  final String birthDate;
  final String relationship;
  final double babyHeight;
  final double babyWeight;

  const SignUpParams({
    required this.name,
    required this.email,
    required this.password,
    required this.babyName,
    required this.gender,
    required this.birthDate,
    required this.relationship,
    required this.babyHeight,
    required this.babyWeight,
  });

  @override
  List<Object> get props => [
        name,
        email,
        password,
        babyName,
        gender,
        birthDate,
        relationship,
        babyHeight,
        babyWeight,
      ];
}
