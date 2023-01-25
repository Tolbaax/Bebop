import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NpParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
