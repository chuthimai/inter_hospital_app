import 'package:isar/isar.dart';
import '../../domain/entities/hospital.dart';

part 'hospital_db_model.g.dart';

@collection
class HospitalDbModel {
  Id id;

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
