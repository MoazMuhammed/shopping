import 'package:equatable/equatable.dart';

class ErrorMessageNetwork extends Equatable {
  final bool status;
  final String message;

  const ErrorMessageNetwork(
      {
        required this.status,
        required this.message,
      });

  factory ErrorMessageNetwork.fromJson(Map<String, dynamic> json) {
    return ErrorMessageNetwork(
      status: json['status'],
      message: json['message'],
        );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
      ];
}
