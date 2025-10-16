import 'package:equatable/equatable.dart';

class ErrMassageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final String success;

  ErrMassageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrMassageModel.fromjson(Map<String, dynamic> json) =>
      ErrMassageModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, statusMessage, success];
}
