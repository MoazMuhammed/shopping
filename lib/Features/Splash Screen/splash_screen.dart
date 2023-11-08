import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Features/Main%20Screen/View/main_screen.dart';
import 'package:shopping/Features/On%20Boarding%20Screen/View/onBoardingScreen.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/View/signIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      // if (MyShared.isFirstOpen()) {
      //   pushReplacement(context, const OnBoardingScreen());
      //   return;
      // }
      if (MyShared.isLoggedIn()) {
        pushReplacement(context, const MainScreen());
      } else {
        pushReplacement(context, const SignIn());
      }
    });

    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .brightness ==
          Brightness.light
          ? Colors.white
          : Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: 40.sp,
                      width: 40.sp,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceOut,
                      child: AppSVG(
                        height: 30.h,
                        width: 20.w,
                        assetName: 'logo',
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      opacity: buttonOpacity,
                      child: Text(
                        "Shopping",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
