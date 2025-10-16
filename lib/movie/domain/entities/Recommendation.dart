import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backdrobpath;
  final int id;

  const Recommendation({required this.id, this.backdrobpath});

  @override
  List<Object?> get props => [backdrobpath, id];
}
