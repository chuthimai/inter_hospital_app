
import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';

class MedicalRecord {
  final int id;
  final DateTime createdTime;
  final Hospital hospital;
  final String? pathUrl;
  String? pathFilePdf;

  MedicalRecord({
    required this.id,
    required this.createdTime,
    required this.hospital,
    this.pathUrl,
    this.pathFilePdf,
  });
}
