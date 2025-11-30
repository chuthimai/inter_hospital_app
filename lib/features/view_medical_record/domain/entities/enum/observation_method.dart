/// FHIR ObservationMethods
/// ValueSet: observation-methods
/// (ví dụ: “automated count”, “light microscopy”, …) :contentReference[oaicite:1]{index=1}
enum ObservationMethod {
  inspection,
  automatedCount,
  manualCount,
  lightMicroscopy,
  highPowerFieldMicroscopy,
  microbialCulture,
  immunological,
  cytologyStain,
  unknown,
}

extension ObservationMethodExtension on ObservationMethod {
  String toCode() {
    switch (this) {
      case ObservationMethod.inspection:
        return "inspection";
      case ObservationMethod.automatedCount:
        return "automated-count";
      case ObservationMethod.manualCount:
        return "manual-count";
      case ObservationMethod.lightMicroscopy:
        return "light-microscopy";
      case ObservationMethod.highPowerFieldMicroscopy:
        return "high-power-field-microscopy";
      case ObservationMethod.microbialCulture:
        return "microbial-culture";
      case ObservationMethod.immunological:
        return "immunological";
      case ObservationMethod.cytologyStain:
        return "cytology-stain";
      case ObservationMethod.unknown:
        return "unknown";
    }
  }

  static ObservationMethod fromCode(String code) {
    switch (code.toLowerCase()) {
      case "inspection":
        return ObservationMethod.inspection;
      case "automated-count":
        return ObservationMethod.automatedCount;
      case "manual-count":
        return ObservationMethod.manualCount;
      case "light-microscopy":
        return ObservationMethod.lightMicroscopy;
      case "high-power-field-microscopy":
        return ObservationMethod.highPowerFieldMicroscopy;
      case "microbial-culture":
        return ObservationMethod.microbialCulture;
      case "immunological":
        return ObservationMethod.immunological;
      case "cytology-stain":
        return ObservationMethod.cytologyStain;
      default:
        return ObservationMethod.unknown;
    }
  }

  /// (Tùy chọn) mô tả tiếng Việt
  String toVietnamese() {
    switch (this) {
      case ObservationMethod.inspection:
        return "Quan sát";
      case ObservationMethod.automatedCount:
        return "Đếm tự động";
      case ObservationMethod.manualCount:
        return "Đếm thủ công";
      case ObservationMethod.lightMicroscopy:
        return "Kính hiển vi ánh sáng";
      case ObservationMethod.highPowerFieldMicroscopy:
        return "Kính hiển vi trường cao";
      case ObservationMethod.microbialCulture:
        return "Nuôi cấy vi sinh";
      case ObservationMethod.immunological:
        return "Phương pháp miễn dịch";
      case ObservationMethod.cytologyStain:
        return "Nhuộm tế bào học";
      case ObservationMethod.unknown:
        return "Không xác định";
    }
  }
}
