import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';
import 'package:inter_hospital_app/share/widgets/custom_text_button.dart';
import 'package:inter_hospital_app/share/widgets/otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});


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
                                child: Text(
                                  "Nhập mã OTP",
                                  style: Theme.of(context).textTheme.displayLarge,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.sp),
                          OtpField(
                            length: 6,
                            onCompleted: (otp) {
                              AppLogger().info("OTP nhập đủ: $otp");
                              //TODO: Cần hành động gửi otp
                            },
                          ),
                          CustomTextButton(
                            text: "Gửi lại mã OTP?",
                            onPressed: () => {},
                          )
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