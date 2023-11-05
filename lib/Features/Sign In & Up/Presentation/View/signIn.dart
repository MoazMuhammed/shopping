import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Utills/Enum/enum.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Core/Widget/Text%20Form%20Field/text_formField.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/Login/login_bloc.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/View/signUp.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final cubit = LoginBloc( sl());


  return BlocProvider(
  create: (context) => cubit
    ,
  child: BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return SafeArea(
    child: Scaffold(
  body: Padding(
    padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 30.sp),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: AppSVG(assetName: 'logo', height: 10.h)),
        SizedBox(
          height: 7.5.h,
        ),
        Text(
          "Welcome!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
        SizedBox(
          height: 1.5.h,
        ),
        Text(
          "please login or sign up to continue our app",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
        ),
        SizedBox(
          height: 3.5.h,
        ),
        AppTextField(
            hint: "Email",
            controller: usernameController,
            isPassword: false,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.emailAddress,
            iconColor: Colors.white),
        SizedBox(
          height: 1.5.h,
        ),
        AppTextField(
          hint: "Password",
          controller: passwordController,
          isPassword: true,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.visiblePassword,
          iconColor: Colors.white,
          obscureText: true,
        ),
        SizedBox(
          height: 7.5.h,
        ),
        AppButton(
          onPressed: () {
            cubit.add(SendLoginEvent(usernameController.text, passwordController.text));
            if(state.loginState == RequestState.isLoading){
              AnimatedSnackBar.rectangle(
                'Waiting',
                'Login in Progress',
                type: AnimatedSnackBarType.info,
                brightness: Brightness.light,
              ).show(context);
            } if (state.loginState == RequestState.isLoaded) {
              AnimatedSnackBar.rectangle(
                'Success',
                'Login success',
                type: AnimatedSnackBarType.success,
                brightness: Brightness.light,
              ).show(context);
            }else if (state.loginState == RequestState.error) {
              AnimatedSnackBar.rectangle(
                'Error',
                'Error',
                type: AnimatedSnackBarType.error,
                brightness: Brightness.light,
              ).show(context);
            }
          },
          label: "Login",
          sizeFont: 17.sp,
          bgColor: Colors.black,
          margin: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 0.sp),
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical:1.h ),
          child: Row(
            children: [
              const Expanded(child: Divider(color: Colors.grey,)),
              SizedBox(width: 1.5.w,),
              Text(
                "or",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(width: 1.5.w,),

              const Expanded(child: Divider(color: Colors.grey,)),

            ],
          ),
        ),
        AppButton(
          onPressed: () {
            push(context, SignUpScreen());
          },
          label: "Login",
          sizeFont: 17.sp,
          bgColor: Colors.black,
          margin: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 0.sp),
        ),
      ],
    ),
  ),
  ));
  },
),
);
  }
}
