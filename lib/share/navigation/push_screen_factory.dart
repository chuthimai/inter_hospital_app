import 'package:inter_hospital_app/share/navigation/implementations/auth_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/create_code_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/home_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/notification_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/profile_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/setting_push_screen.dart';
import 'package:inter_hospital_app/share/navigation/implementations/view_code_push_screen.dart';
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
      case PushScreenType.auth:
        return AuthPushScreen();
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
      case PushScreenType.viewCode:
        return ViewCodePushScreen();
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
    }
  }
}