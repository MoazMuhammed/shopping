import 'package:shopping/Features/Home%20Screen/Domain/Entites/data.dart';

class Home {
  final bool status;
  final Data data;

  Home({required this.status, required this.data});

  @override
  List<Object?> get props => [status, data];
}