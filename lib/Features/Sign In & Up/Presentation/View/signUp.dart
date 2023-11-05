import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shopping/Core/Service/service_locator.dart';
import 'package:shopping/Core/Utills/SVG/svg.dart';
import 'package:shopping/Core/Widget/Button/button.dart';
import 'package:shopping/Core/Widget/Text%20Form%20Field/text_formField.dart';
import 'package:shopping/Features/Sign%20In%20&%20Up/Presentation/Controller/SignUp/sign_up_bloc.dart';

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
  child: BlocBuilder<SignUpBloc, SignUpState>(
  builder: (context, state) {
    return Form(
      key: formKey,
      child: SafeArea(
          child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.sp, vertical: 30.sp),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Center(child: AppSVG(assetName: 'logo', height: 10.h)),
            SizedBox(
              height: 7.5.h,
            ),
            Text(
              "Sign Up",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Text(
              "Create an new account",
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
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
                iconColor: Colors.white),
            SizedBox(
              height: 1.5.h,
            ),
            AppTextField(
                hint: "Email",
                controller: emailController,
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
                iconColor: Colors.white),
            SizedBox(
              height: 1.5.h,
            ),   AppTextField(
                hint: "phone",
                controller: phoneController,
                isPassword: true,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.visiblePassword,
                iconColor: Colors.white),
            SizedBox(
              height: 1.5.h,
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Row(
              children: [
                Checkbox(
                  value: isChecked,activeColor: Colors.black,

                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  "By creating an account you have to agree\nwith our them & condition.",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16.sp),
                ),
              ],
            ),
            SizedBox(
              height: 5.5.h,
            ),

            AppButton(
              onPressed: () {
                if (isChecked == true || state.signUp!.status == true) {
                  bloc.add(SendSignUpEvent(usernameController.text, emailController.text, passwordController.text,phoneController.text));
                }if (isChecked == false || state.signUp!.status == false){
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(
                      content: Text(state.signUp!.message.toString()),
                    ),
                  );
                } else {
                }
              },
              label: "Sign Up",
              sizeFont: 17.sp,
              bgColor: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 0.sp),
            ),
          ]),
        ),
      )),
    );
  },
),
);
  }
}
