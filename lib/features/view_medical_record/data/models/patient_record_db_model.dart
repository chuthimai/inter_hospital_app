import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:isar/isar.dart';
import '../../domain/entities/medical_record.dart';

part 'patient_record_db_model.g.dart';

@collection
class PatientRecordDbModel {
  Id id;
  late DateTime createTime;
  late String? pathUrl;
  late String pathFilePdf;

  @Index()
  final hospital = IsarLink<HospitalDbModel>();

  PatientRecordDbModel({
    required this.id,
    required this.createTime,
    this.pathUrl,
    required this.pathFilePdf,
  });

  /// DB → Domain
  Future<MedicalRecord> toEntity() async {
    await hospital.load();
    return MedicalRecord(
      id: id,
      createdTime: createTime,
      hospital: hospital.value!.toEntity(),
      pathUrl: pathUrl,
      pathFilePdf: pathFilePdf,
    );
  }

  /// Domain → DB
  factory PatientRecordDbModel.fromEntity(MedicalRecord entity) {
    final hospitalEntity = HospitalDbModel.fromEntity(entity.hospital);
    final model = PatientRecordDbModel(
      id: entity.id,
      createTime: entity.createdTime,
      pathFilePdf: entity.pathFilePdf!,
      pathUrl: entity.pathUrl,
    );
    model.hospital.value = hospitalEntity;

    return model;
  }
}
