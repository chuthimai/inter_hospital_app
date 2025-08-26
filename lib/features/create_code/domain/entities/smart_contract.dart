import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';

class SmartContract {
  final int id;
  final String key;
  final String permission;
  final DateTime validFrom;
  final DateTime validTo;
  final Hospital subject;

  SmartContract({
    required this.id,
    required this.key,
    required this.permission,
    required this.validFrom,
    required this.validTo,
    required this.subject,
  });
}
