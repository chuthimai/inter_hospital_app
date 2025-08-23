class HealthInsurance {
  final int id;
  final String objectType;
  final DateTime effectiveDate;
  final DateTime expiredDate;
  final String registeredHospital;
  final DateTime lastUpdateTime;

  HealthInsurance({
    required this.id,
    required this.objectType,
    required this.effectiveDate,
    required this.expiredDate,
    required this.registeredHospital,
    required this.lastUpdateTime
  });
}
