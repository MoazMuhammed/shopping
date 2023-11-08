import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/Core/Cubits/Main%20Screen%20Cubit/main_screen_cubit.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Features/Home%20Screen/View/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  MainScreenCubit cubit = MainScreenCubit();

  int index = 0;
  List<Widget> listScreens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocBuilder<MainScreenCubit, MainScreenState>(
  builder: (context, state) {
    return SafeArea(child: Scaffold(
      body: cubit.screens[cubit.index] ,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Theme.of(context).brightness == Brightness.light
            ? Colors.black
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
                    ? Colors.black
                    : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
          BottomNavigationBarItem(
              label: 'Search',
              icon: AppSVG(
                assetName: 'Search',
                color: cubit.index == 1
                    ? Colors.black
                    : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
          BottomNavigationBarItem(
              label: 'Card',
              icon: AppSVG(
                assetName: 'scanner',
                color: cubit.index == 2
                    ? Colors.black
                    : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              )),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: AppSVG(
                assetName: 'cart',
                color: cubit.index == 3
                    ? Colors.black
                    : Theme.of(context).brightness == Brightness.light
                    ? Colors.black
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
