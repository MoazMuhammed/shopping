part of 'main_screen_cubit.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}
class BackHomeState extends MainScreenState {}

class SwitchToCardScreen extends MainScreenState {}
class SwitchToProfileScreen extends MainScreenState {}