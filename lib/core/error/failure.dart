import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String massage;

  const Failure({required this.massage});

  @override
  List<Object?> get props => [massage];
}

class serverFailure extends Failure {
  const serverFailure({required super.massage});
}

class dataBaseFailure extends Failure {
  const dataBaseFailure({required super.massage});
}
