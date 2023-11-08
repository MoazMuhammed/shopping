// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Utills/Navigators/navigators.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Core/Widget/Text%20Form%20Field/text_formField.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/SignUp/sign_up_bloc.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/View/signIn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final bloc = SignUpBloc(sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.signUp!.status == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                padding:
                    EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
                content: Text(state.signUp!.message.toString()),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                padding:
                    EdgeInsets.symmetric(vertical: 12.sp, horizontal: 12.sp),
                content: Text(state.signUp!.message.toString()),
              ),
            );
          }
        },
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: formKey,
                        child: SafeArea(
                            child: Scaffold(
                          body: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22.sp, vertical: 40.sp),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Create a new \naccount",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22.sp),
                                  ),
                                  SizedBox(
                                    height: 3.5.h,
                                  ),
                                  AppTextField(
                                      hint: "User Name",
                                      controller: usernameController,
                                      isPassword: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.name,
                                      iconColor: Colors.black38),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  AppTextField(
                                      hint: "Email",
                                      controller: emailController,
                                      isPassword: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.emailAddress,
                                      iconColor: Colors.black38),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  AppTextField(
                                      hint: "Password",
                                      controller: passwordController,
                                      isPassword: true,
                                      textInputAction: TextInputAction.next,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      iconColor: Colors.black38),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  AppTextField(
                                      hint: "phone",
                                      controller: phoneController,
                                      isPassword: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      iconColor: Colors.black38),
                                  SizedBox(
                                    height: 1.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        activeColor: Colors.black,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            isChecked = value!;
                                          });
                                        },
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          "By creating an account you have to agree with our them & condition.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.sp,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  AppButton(
                                    onPressed: () {
                                      if (isChecked) {
                                        bloc.add(SendSignUpEvent(
                                            usernameController.text,
                                            emailController.text,
                                            passwordController.text,
                                            phoneController.text));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Please agree to the terms and conditions"),
                                          ),
                                        );
                                      }
                                    },
                                    label: "Sign Up",
                                    sizeFont: 17.sp,
                                    bgColor: Colors.black,
                                    borderRadius: BorderRadius.circular(14.sp),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 0.sp, vertical: 0.sp),
                                  ),
                                  SizedBox(
                                    height: 2.5.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Already have account?",
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
                                            push(context, const SignIn()),
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
                                ]),
                          ),
                        )),
                      ),
                    )),
              ),
            );
          },
        ),
      ),
    );
  }
}
