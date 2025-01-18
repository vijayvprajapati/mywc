import 'package:flutter/material.dart';
import 'package:mywc/bloc/login/login_bloc.dart';
import 'package:mywc/data/model/request/login/login_request.dart';
import 'package:mywc/locator/locator.dart';
import 'package:mywc/widgets/app_button.dart';
import 'package:mywc/widgets/app_textform_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.data});

  final String? data;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _bloc = locator<LoginBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.verticalSpace,
            const Text('Sign in '),
            const AppTextField(label: 'email id', hint: 'email id'),
            20.verticalSpace,
            const AppTextField(label: 'password', hint: 'password'),
            20.verticalSpace,
            AppButton(btnTitle: 'Sign in', onClick: _onLoginClick)
          ],
        ),
      ),
    );
  }

  void _onLoginClick() {
    // _bloc.add(LoginInputEvent(
    //     request:
    //         LoginRequest(email: 'vijay@gmail.com', password: 'Vijay@123')));
  }
}
