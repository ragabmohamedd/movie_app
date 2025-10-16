import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:moviesapp/core/error/failure.dart';

abstract class BaseUsecase<T, parametars> {
  Future<Either<Failure, T>> call(parametars parameters);
}

class Noparametars extends Equatable {
  const Noparametars();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
