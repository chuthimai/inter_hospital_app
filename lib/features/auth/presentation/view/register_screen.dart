import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/custom_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    vertical: 24.sp,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Đăng ký",
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.sp),
                      const CustomTextFormField(
                        hintText: "Số CCCD",
                        prefixIcon: Icon(Icons.credit_card),
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        text: "Nhận mã OTP về điện thoại",
                        onPressed: () => PushScreenFactory()
                            .create(PushScreenType.otp)
                            .push(context),
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          CustomTextButton(
                            text: "Đăng nhập?",
                            padding: EdgeInsets.only(top: 12.sp),
                            fontSize: 14.sp,
                            onPressed: () => PushScreenFactory()
                                .create(PushScreenType.login)
                                .push(context),
                          ),
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
    );
  }
}
