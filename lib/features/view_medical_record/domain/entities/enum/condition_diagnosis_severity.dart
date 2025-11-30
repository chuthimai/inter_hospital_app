/// ConditionDiagnosisSeverity - Mức độ nghiêm trọng của chẩn đoán (FHIR)
/// ValueSet: http://hl7.org/fhir/ValueSet/condition-severity
/// CodeSystem: SNOMED CT
enum ConditionDiagnosisSeverity {
  severe,
  moderate,
  mild,
}

extension ConditionDiagnosisSeverityExtension on ConditionDiagnosisSeverity {
  String toVietnamese() {
    switch (this) {
      case ConditionDiagnosisSeverity.severe:
        return "Nghiêm trọng";
      case ConditionDiagnosisSeverity.moderate:
        return "Trung bình";
      case ConditionDiagnosisSeverity.mild:
        return "Nhẹ";
    }
  }

  /// Trả về code SNOMED CT
  String toCode() {
    switch (this) {
      case ConditionDiagnosisSeverity.severe:
        return "24484000";
      case ConditionDiagnosisSeverity.moderate:
        return "6736007";
      case ConditionDiagnosisSeverity.mild:
        return "255604002";
    }
  }

  /// Parse từ code SNOMED CT về enum
  static ConditionDiagnosisSeverity fromCode(String code) {
    switch (code) {
      case "24484000":
        return ConditionDiagnosisSeverity.severe;
      case "6736007":
        return ConditionDiagnosisSeverity.moderate;
      case "255604002":
        return ConditionDiagnosisSeverity.mild;
      default:
        throw ArgumentError("Invalid ConditionDiagnosisSeverity code: $code");
    }
  }
}
