import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';
import 'package:inter_hospital_app/share/utils/date_formatter.dart';

class UserQrPayload {
  static String format(User user) {
    return "${user.id}||"
        "${user.name}|"
        "${DateFormatter.formatForOrCode(user.birthDate)}|"
        "${user.gender ? "Nam" : "Nữ"}|"
        "${user.address}|";
  }
}