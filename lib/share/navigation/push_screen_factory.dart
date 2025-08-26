import 'package:inter_hospital_app/share/navigation/implementations/change_password_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/change_phone_number_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/forgot_password_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/login_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/create_code_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/home_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/notification_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/otp_auth_phone_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/otp_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/profile_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/profile_qr_code_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/setting_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_list_codes_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_followup_appointment_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_health_insurance_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_medical_record_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_prescription_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_transfer_letter_push_screen.dart';
import 'package:inter_hospital_app/share/types/push_screen_type.dart';

import 'interfaces/push_screen.dart';

class PushScreenFactory {
  PushScreen create(PushScreenType type) {
    switch (type) {
      case PushScreenType.login:
        return LoginPushScreen();
      case PushScreenType.forgotPassword:
        return ForgotPasswordPushScreen();
      case PushScreenType.otp:
        return OtpPushScreen();
      case PushScreenType.changePassword:
        return ChangePasswordPushScreen();
      case PushScreenType.createCode:
        return CreateCodePushScreen();
      case PushScreenType.home:
        return HomePushScreen();
      case PushScreenType.notification:
        return NotificationPushScreen();
      case PushScreenType.profile:
        return ProfilePushScreen();
      case PushScreenType.setting:
        return SettingPushScreen();
      case PushScreenType.viewListCodes:
        return ViewListCodesPushScreen();
      case PushScreenType.viewFollowupAppointment:
        return ViewFollowupAppointmentPushScreen();
      case PushScreenType.viewHealthInsurance:
        return ViewHealthInsurancePushScreen();
      case PushScreenType.viewMedicalRecord:
        return ViewMedicalRecordPushScreen();
      case PushScreenType.viewPrescription:
        return ViewPrescriptionPushScreen();
      case PushScreenType.viewTransferLetter:
        return ViewTransferLetterPushScreen();
      case PushScreenType.changePhoneNumber:
        return ChangePhoneNumberPushScreen();
      case PushScreenType.otpAuthPhone:
        return OtpAuthPhonePushScreen();
      case PushScreenType.profileQrCode:
        return ProfileQrCodePushScreen();
    }
  }
}