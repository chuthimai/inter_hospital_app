
import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';

import '../entities/hospital.dart';
import '../entities/permission.dart';

abstract class PermissionRepository {
  Future<List<Permission>> getAllPermissions(User user);  // local
  Future<void> deleteLocalOutDatePermissions();  // local
  Future<void> deleteLocalAllPermissions();  // local
  Future<void> createPermission(Hospital hospital);  // remote
}