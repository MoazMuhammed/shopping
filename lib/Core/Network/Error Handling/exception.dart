import 'package:shopping/Core/Network/Error%20Handling/network/error_message_network.dart';

class ServerException implements Exception{
  final ErrorMessageNetwork errorMessageNetwork;

  const ServerException({required this.errorMessageNetwork});
}