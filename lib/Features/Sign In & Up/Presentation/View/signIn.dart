// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared.dart';
import 'package:shopping/Core/Utills/Shared%20Preferences/my_shared_keys.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Core/Widget/Text%20Form%20Field/text_formField.dart';
import 'package:shopping/Features/Main%20Screen/View/main_screen.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/Login/login_bloc.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/View/signUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final bloc = LoginBloc(sl());

@override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.login!.status == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.login!.message.toString()),
              ),
            );
            final token = state.login?.data?.token;
            if (token != null) {
              MyShared.putString(
                  key: MySharedKeys.apiToken, value: token);
            }
            print(MySharedKeys.apiToken);
            pushReplacement(context, const MainScreen());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.login!.message.toString()),
              ),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: SafeArea(
                          child: Scaffold(
                        body: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 22.sp, vertical: 40.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Welcome To",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.sp),
                              ),
                              Text(
                                "Shoppy",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 23.sp),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              AppTextField(
                                  hint: "Email",
                                  controller: usernameController,
                                  isPassword: false,
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.emailAddress,
                                  iconColor: Colors.black),
                              SizedBox(
                                height: 2.h,
                              ),
                              AppTextField(
                                hint: "Password",
                                controller: passwordController,
                                isPassword: true,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.visiblePassword,
                                iconColor: Colors.black,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 7.h,
                              ),
                              AppButton(
                                onPressed: ()  {
                                  bloc.add(SendLoginEvent(
                                      usernameController.text,
                                      passwordController.text));
                                },
                                label: "Login",
                                borderRadius: BorderRadius.circular(14.sp),
                                sizeFont: 17.sp,
                                bgColor: Colors.black,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0.sp, vertical: 0.sp),
                              ),
                              SizedBox(
                                height: 0.8.h,
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Text(
                                  "Forget password!",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15.sp,
                                      color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Not a member ?",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        push(context, const SignUpScreen()),
                                    child: Text(
                                      "Join Now",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          fontSize: 15.sp,
                                          color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
