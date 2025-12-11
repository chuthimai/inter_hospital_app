import 'package:isar/isar.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/permission.dart';
import '../../domain/entities/enum/permission_type.dart';
import 'hospital_db_model.dart';

part 'permission_db_model.g.dart';

@collection
class PermissionDbModel {
  Id id = 0;

  @enumerated
  late PermissionType type;

  late DateTime expiredTime;
  late int userId;

  final hospital = IsarLink<HospitalDbModel>();

  PermissionDbModel({
    required this.id,
    required this.type,
    required this.expiredTime,
    required this.userId,
  });

  /// Convert domain entity → DB model
  factory PermissionDbModel.fromEntity(Permission permission) {
    final model = PermissionDbModel(
      id: permission.id,
      type: permission.type,
      expiredTime: permission.expiredTime,
      userId: permission.userId,
    );

    model.hospital.value = HospitalDbModel.fromEntity(permission.hospital);
    return model;
  }

  /// Convert DB → domain entity
  Future<Permission> toEntity() async {
    await hospital.load();
    return Permission(
      id: id,
      type: type,
      expiredTime: expiredTime,
      hospital: hospital.value!.toEntity(),
      userId: userId,
    );
  }
}
