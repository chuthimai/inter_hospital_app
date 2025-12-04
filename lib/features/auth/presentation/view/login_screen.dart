import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/db/secure_token_storage.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/app_snack_bar.dart';
import 'package:inter_hospital_app/share/widgets/custom_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/login_params.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _rememberId = true;

  @override
  void initState() {
    super.initState();
    _loadLastId();
  }

  Future<void> _loadLastId() async {
    final prefs = await SharedPreferences.getInstance();
    final savedId = prefs.getString('last_cccd');
    if (savedId != null) {
      _idController.text = savedId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) async {
          if (state is AuthSuccess) {
            // thông báo autofill context đã hoàn tất
            TextInput.finishAutofillContext();

            // lưu CCCD nếu người dùng chọn “ghi nhớ”
            if (_rememberId) {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('last_cccd', _idController.text);
            }

            PushScreenFactory()
                .create(PushScreenType.home)
                .push(context);
            AppSnackBar.success(context, "Đăng nhập thành công");
          } else if (state is AuthFailure) {
            AppSnackBar.error(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          return SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16.sp),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32.sp,
                        vertical: 24.sp,
                      ),
                      child: Form(
                        key: _formKey,
                        child: AutofillGroup(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Đăng nhập",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 16.sp),
                              CustomTextFormField(
                                controller: _idController,
                                hintText: "Số CCCD",
                                prefixIcon: const Icon(Icons.credit_card),
                                keyboardType: TextInputType.number,
                                autofillHints: const [AutofillHints.username],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Vui lòng nhập số CCCD";
                                  }
                                  if (value.length != 12) {
                                    return "CCCD phải có 12 số";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),
                              CustomTextFormField(
                                controller: _passwordController,
                                hintText: "*******",
                                prefixIcon: const Icon(Icons.vpn_key),
                                isPassword: true,
                                autofillHints: const [AutofillHints.password],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Vui lòng nhập mật khẩu";
                                  }
                                  if (value.length < 8) {
                                    return "Mật khẩu tối thiểu 8 ký tự";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberId,
                                    onChanged: (v) =>
                                        setState(() => _rememberId = v ?? true),
                                  ),
                                  const Text("Ghi nhớ số CCCD"),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              CustomButton(
                                text: "Đăng nhập",
                                onPressed: () => _onClickLogin(context),
                              ),
                              Row(
                                children: [
                                  CustomTextButton(
                                    text: "Quên mật khẩu?",
                                    padding: EdgeInsets.only(top: 12.sp),
                                    fontSize: 14.sp,
                                    onPressed: () => {
                                      PushScreenFactory()
                                          .create(PushScreenType.forgotPassword)
                                          .push(context)
                                    }
                                  ),
                                  const Spacer(),
                                ],
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
          );
        },
      ),
    );
  }

  void _onClickLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus();

      final deviceToken = await SecureTokenStorage().readDeviceToken();
      final request = LoginParams(
        id: int.parse(_idController.text),
        password: _passwordController.text,
        deviceToken: deviceToken,
      );

      context.read<AuthCubit>().login(request);
    }
  }
}
