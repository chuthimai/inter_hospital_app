import 'enum/record_status.dart';

class PatientRecord {
  final int id;
  final RecordStatus status;
  final DateTime createdTime;
  final String? pathUrl;
  String? pathFilePdf;

  PatientRecord({
    required this.id,
    this.status = RecordStatus.complete,
    required this.createdTime,
    this.pathUrl,
    this.pathFilePdf,
  });
}
