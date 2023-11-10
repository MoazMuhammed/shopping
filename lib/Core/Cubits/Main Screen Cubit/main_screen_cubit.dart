import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/View/home_screen.dart';
part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());
  int index = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToCardScreen() {
    index = 4;
    emit(SwitchToCardScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}