enum PermissionType {
  readPatientRecord,
  unknow,
}

extension PermissionTypeVi on PermissionType {
  String toVietnamese() {
    switch (this) {
      case PermissionType.readPatientRecord:
        return "Xem bệnh án";
      case PermissionType.unknow:
        return "Không xác định";
    }
  }
}

extension PermissionTypeExchange on PermissionType {
  static PermissionType fromString(String value) {
    switch (value) {
      case 'READ_PATIENT_RECORD':
        return PermissionType.readPatientRecord;
      default:
        return PermissionType.unknow;
    }
  }
}
