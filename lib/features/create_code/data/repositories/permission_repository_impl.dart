import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';
import 'package:inter_hospital_app/features/create_code/data/models/permission_db_model.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/enum/permission_type.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/entities/hospital.dart';
import '../../domain/entities/permission.dart';
import '../../domain/repositories/permission_repository.dart';
import '../datasources/permission_local_data_source.dart';
import '../datasources/permission_remote_data_source.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionLocalDataSource _localDataSource;
  final PermissionRemoteDataSource _remoteDataSource;

  PermissionRepositoryImpl({
    required localDataSource,
    required remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  @override
  Future<void> createPermission(Hospital hospital) async {
    try {
      final permissionApi = await _remoteDataSource.createPermission(hospital);
      final permission = Permission(
        id: permissionApi.identifier,
        expiredTime: permissionApi.expiredTime,
        type: PermissionTypeExchange.fromString(permissionApi.type),
        hospital: hospital,
        userId: int.parse(permissionApi.userIdentifier),
      );
      await _localDataSource.savePermission(PermissionDbModel.fromEntity(permission));
    } catch (e) {
      AppLogger().error("Local/Remote data: $e");
      throw Exception("Tạo mã thất bại");
    }
  }

  @override
  Future<void> deleteLocalAllPermissions() async {
    try {
      await _localDataSource.deleteLocalAllPermissions();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
  }

  @override
  Future<void> deleteLocalOutDatePermissions() async {
    try {
      await _localDataSource.deleteLocalOutDatePermissions();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
  }

  @override
  Future<List<Permission>> getAllPermissions(User user) async {
    try {
      final permissionsDb = await _localDataSource.getAllPermissions(user);
      return await Future.wait(permissionsDb.map((e) => e.toEntity()).toList());
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
    return [];
  }
}
