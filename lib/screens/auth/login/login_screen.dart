import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_utils.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback show;

  const LoginScreen(this.show, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  FocusNode email_F = FocusNode();
  final password = TextEditingController();
  FocusNode password_F = FocusNode();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 96.w, height: 90.h),

            SvgPicture.asset(
              'assets/icons/code2earn_logo.svg',
              height: 50.sp,
            ),
            SizedBox(height: 16.0),
            // Text(
            //   "Code2Earn",
            //   style: TextStyle(
            //     fontSize: 20.sp,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            SizedBox(height: 8.0),
            Text(
              "Tap into the pulse of the world",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 54.0),
            // Textfild(email, email_F, 'Email', Icons.email),
            AppTextField(
              email,
              "Email",
              svgPath: "envelope.svg",
            ),
            SizedBox(height: 20.h),
            // Textfild(password, password_F, 'Password', Icons.lock),
            AppTextField(
              password,
              "Password",
              obscureText: true,
              svgPath: "lock.svg",
            ),
            SizedBox(height: 15.h),
            forget(),
            SizedBox(height: 15.h),
            login(),
            SizedBox(height: 15.h),
            Have()
          ],
        ),
      ),
    );
  }

  Widget Have() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have account?  ",
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey,
            ),
          ),
          GestureDetector(
            onTap: widget.show,
            child: Text(
              "Sign up ",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget login() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: AppButton(
          buttonTxt: "Login",
          onTap: () async {
            try {
              // await Authentication()
              //     .Login(email: email.text, password: password.text);
            } on Exception catch (e) {
              AppUtils.showAppSnackBar(
                  context: context, content: "${e}");
            }
          },
          isLoading: () {
            setState(() {});
          },
        ));
  }

  Padding forget() {
    return Padding(
      padding: EdgeInsets.only(left: 230.w),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'Forgot password?',
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
