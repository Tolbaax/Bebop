import 'package:equatable/equatable.dart';

class BabyParams extends Equatable {
  final String babyName;
  final String birthDate;
  final double height;
  final double weight;
  final String gender;
  final String profileUrl;

  const BabyParams({
    required this.babyName,
    required this.birthDate,
    required this.height,
    required this.weight,
    required this.gender,
    required this.profileUrl,
  });

  @override
  List<Object?> get props => [
        babyName,
        birthDate,
        height,
        weight,
        gender,
        profileUrl,
      ];
}
