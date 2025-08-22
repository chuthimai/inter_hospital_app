import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/navigation/push_screen_factory.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';
import 'package:inter_hospital_app/share/widgets/custom_button.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_field.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_outlined),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32.sp, 0, 32.sp, 32.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: "change_phone_number",
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      "Đổi số điện thoại",
                                      style: Theme.of(context).textTheme.displayLarge,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.sp),
                          const CustomTextFormField(
                            hintText: "Số điện thoại mới",
                            prefixIcon: Icon(Icons.phone_android),
                          ),
                          SizedBox(height: 16.h),

                          CustomButton(
                            text: "Lưu thay đổi",
                            onPressed: () => PushScreenFactory()
                                .create(PushScreenType.otpAuthPhone)
                                .push(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}