
import 'enum/permission_type.dart';
import 'hospital.dart';

class Permission {
  final int id;
  final PermissionType type;
  final DateTime expiredTime;
  final Hospital hospital;
  final int userId;

  Permission({
    required this.id,
    this.type = PermissionType.readPatientRecord,
    required this.expiredTime,
    required this.hospital,
    required this.userId,
  });
}
