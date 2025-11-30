/// RecordStatus - trạng thái bản ghi (theo FHIR Common Codes)
/// CodeSystem: http://terminology.hl7.org/CodeSystem/completeness
enum RecordStatus {
  complete,
  incomplete,
}

extension RecordStatusExtention on RecordStatus {
  String toVietnamese() {
    switch (this) {
      case RecordStatus.complete:
        return "Hoàn tất";
      case RecordStatus.incomplete:
        return "Chưa hoàn tất";
    }
  }

  String toCode() {
    switch (this) {
      case RecordStatus.complete:
        return "complete";
      case RecordStatus.incomplete:
        return "incomplete";
    }
  }

  static RecordStatus fromCode(String code) {
    switch (code.toLowerCase()) {
      case "complete":
        return RecordStatus.complete;
      case "incomplete":
        return RecordStatus.incomplete;
      default:
        throw ArgumentError("Unknown RecordStatus code: $code");
    }
  }
}
