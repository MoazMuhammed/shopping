import 'package:flutter/material.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared_keys.dart';

class ThemeProvider extends ChangeNotifier {
  int currentTheme = 0;

  ThemeMode get themeMode {
    if (currentTheme == 1) {
      return ThemeMode.dark;
    } if (currentTheme == 2) {
      return ThemeMode.light;
    }
    else {
      return ThemeMode.system;
    }
  }

  changeTheme(int theme) {
    MyShared.putInt(key: MySharedKeys.theme, value: theme);
    currentTheme = theme;
    notifyListeners();
  }

  initialize()async{
    currentTheme =  MyShared.getInt(key: MySharedKeys.theme);
    notifyListeners();
  }
}