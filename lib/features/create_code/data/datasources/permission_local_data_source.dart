import 'package:inter_hospital_app/features/auth/domain/entities/user.dart';
import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:inter_hospital_app/share/db/isar_service.dart';
import 'package:isar/isar.dart';

import '../models/permission_db_model.dart';

abstract class PermissionLocalDataSource {
  Future<List<PermissionDbModel>> getAllPermissions(User user);

  Future<void> deleteLocalOutDatePermissions();

  Future<void> deleteLocalAllPermissions();

  Future<void> savePermission(PermissionDbModel permission);
}

class PermissionLocalDataSourceImpl implements PermissionLocalDataSource {
  Future<Isar> get _isar async => await IsarService.instance;

  @override
  Future<void> deleteLocalAllPermissions() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.permissionDbModels.clear();
    });
  }

  @override
  Future<void> deleteLocalOutDatePermissions() async {
    final isar = await _isar;

    final now = DateTime.now();

    await isar.writeTxn(() async {
      final outdated = await isar.permissionDbModels
          .filter()
          .expiredTimeLessThan(now)
          .findAll();

      for (final item in outdated) {
        await isar.permissionDbModels.delete(item.id);
      }
    });
  }

  @override
  Future<List<PermissionDbModel>> getAllPermissions(User user) async {
    final isar = await _isar;
    final items = await isar.permissionDbModels
        .where()
        .filter()
        .userIdEqualTo(user.id)
        .sortByExpiredTimeDesc()
        .findAll();

    for (final item in items) {
      await item.hospital.load();
    }

    return items;
  }

  @override
  Future<void> savePermission(PermissionDbModel permission) async {
    final isar = await _isar;

    await isar.writeTxn(() async {
      final hospital = permission.hospital.value;
      if (hospital != null) {
        await isar.hospitalDbModels.put(hospital);
        permission.hospital.value = hospital;
      }
      await isar.permissionDbModels.put(permission);
      await permission.hospital.save();
    });
  }
}
