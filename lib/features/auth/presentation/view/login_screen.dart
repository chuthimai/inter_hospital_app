import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/features/auth/domain/entities/login_params.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:inter_hospital_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/custom_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_field.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _id = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            PushScreenFactory().create(PushScreenType.home).push(context);
          } else if (state is AuthFailure) {
            PushScreenFactory().create(PushScreenType.login).push(context);
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.sp),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32.sp,
                      vertical: 16.sp,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Đăng nhập",
                                  style: Theme.of(context).textTheme.displayLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.sp),
                          CustomTextFormField(
                            hintText: "Số CCCD",
                            prefixIcon: const Icon(Icons.credit_card),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập số CCCD";
                              if (value.length != 12) return "CCCD phải có 12 số";
                              return null;
                            },
                            onSaved: (value) => _id = value!,
                          ),
                          SizedBox(height: 16.h),
                          CustomTextFormField(
                            hintText: "*******",
                            prefixIcon: const Icon(Icons.vpn_key),
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return "Vui lòng nhập mật khẩu";
                              if (value.length < 8)
                                return "Mật khẩu tối thiểu 8 ký tự";
                              return null;
                            },
                            onSaved: (value) => _password = value!,
                          ),
                          SizedBox(height: 16.h),
                          CustomButton(
                            text: "Đăng nhập",
                            onPressed: () => _onClickLogin(context),
                          ),
                          CustomTextButton(
                            text: "Quên mật khẩu?",
                            onPressed: () => PushScreenFactory()
                                .create(PushScreenType.forgotPassword)
                                .push(context),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onClickLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final request = LoginParams(
        id: int.parse(_id),
        password: _password,
      );
      context.read<AuthCubit>().login(request);
    }
  }
}
