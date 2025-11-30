/// FHIR ObservationStatus
/// CodeSystem: http://hl7.org/fhir/observation-status
enum ObservationStatus {
  registered,
  preliminary,
  final_,
  amended,
  corrected,
  cancelled,
  enteredInError,
  unknown,
}

extension ObservationStatusExtension on ObservationStatus {
  /// Convert enum → Vietnamese description
  String toVietnamese() {
    switch (this) {
      case ObservationStatus.registered:
        return "Đã ghi nhận (chưa hoàn tất)";
      case ObservationStatus.preliminary:
        return "Kết quả sơ bộ";
      case ObservationStatus.final_:
        return "Kết quả cuối cùng";
      case ObservationStatus.amended:
        return "Đã chỉnh sửa sau phát hành";
      case ObservationStatus.corrected:
        return "Đã sửa lỗi";
      case ObservationStatus.cancelled:
        return "Đã hủy";
      case ObservationStatus.enteredInError:
        return "Nhập nhầm (không hợp lệ)";
      case ObservationStatus.unknown:
        return "Không xác định";
    }
  }

  /// Convert FHIR code (string) → enum
  static ObservationStatus fromCode(String code) {
    switch (code) {
      case "registered":
        return ObservationStatus.registered;
      case "preliminary":
        return ObservationStatus.preliminary;
      case "final":
        return ObservationStatus.final_;
      case "amended":
        return ObservationStatus.amended;
      case "corrected":
        return ObservationStatus.corrected;
      case "cancelled":
        return ObservationStatus.cancelled;
      case "entered-in-error":
        return ObservationStatus.enteredInError;
      default:
        return ObservationStatus.unknown;
    }
  }
}
