import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';
import 'package:isar/isar.dart';

part 'hospital_db_model.g.dart';

@collection
class HospitalDbModel {
  Id id = 0;

  @Index(unique: true)
  late String name;

  HospitalDbModel({
    required this.id,
    required this.name,
  });

  factory HospitalDbModel.fromEntity(Hospital hospital) =>
      HospitalDbModel(id: hospital.id, name: hospital.name);

  Hospital toEntity() => Hospital(id: id, name: name);
}
