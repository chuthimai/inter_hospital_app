import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Đổi mật khẩu",
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      const CustomTextFormField(
                        hintText: "Mật khẩu cũ",
                        prefixIcon: Icon(Icons.password),
                        isPassword: true,
                      ),
                      SizedBox(height: 16.h),
                      const CustomTextFormField(
                        hintText: "Mật khẩu mới",
                        prefixIcon: Icon(Icons.vpn_key),
                        isPassword: true,
                      ),
                      const CustomTextFormField(
                        hintText: "Nhập lại mật khẩu mới",
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}