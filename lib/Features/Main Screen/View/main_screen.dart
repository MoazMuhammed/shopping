import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Core/Cubits/Main%20Screen%20Cubit/main_screen_cubit.dart';
import 'package:shopping/Core/Styles/Colors/colors.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Features/Home%20Screen/Presentation/View/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenCubit cubit = MainScreenCubit();

  int index = 0;
  List<Widget> listScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: cubit.screens[cubit.index],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primary,
              backgroundColor: AppColors.backGround,
              unselectedItemColor:
                  Theme.of(context).brightness == Brightness.light
                      ? AppColors.unselected
                      : Colors.white,
              onTap: (value) {
                cubit.index = value;
                setState(() {});
              },
              currentIndex: cubit.index,
              items: [
                BottomNavigationBarItem(
                    label: 'Home',
                    icon: AppSVG(
                      assetName: 'home',
                      color: cubit.index == 0
                          ? AppColors.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.unselected
                              : Colors.white,
                    )),
                BottomNavigationBarItem(
                    label: 'Search',
                    icon: AppSVG(
                      assetName: 'search',
                      color: cubit.index == 1
                          ? AppColors.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.unselected
                              : Colors.white,
                    )),
                BottomNavigationBarItem(
                    label: 'Shipping',
                    icon: AppSVG(
                      assetName: 'shipping',
                      color: cubit.index == 2
                          ? AppColors.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.unselected
                              : Colors.white,
                    )),
                BottomNavigationBarItem(
                    label: 'Profile',
                    icon: AppSVG(
                      assetName: 'profile',
                      color: cubit.index == 3
                          ? AppColors.primary
                          : Theme.of(context).brightness == Brightness.light
                              ? AppColors.unselected
                              : Colors.white,
                    )),
              ],
            ),
          ));
        },
      ),
    );
  }
}
