/// FHIR ObservationCategoryCode
/// CodeSystem: http://terminology.hl7.org/CodeSystem/observation-category
enum ObservationCategoryCode {
  socialHistory,
  vitalSigns,
  imaging,
  laboratory,
  procedure,
  survey,
  exam,
  therapy,
  activity,
  unknow,
}

extension ObservationCategoryCodeExtension on ObservationCategoryCode {
  String toVietnamese() {
    switch (this) {
      case ObservationCategoryCode.socialHistory:
        return "Tiền sử xã hội";
      case ObservationCategoryCode.vitalSigns:
        return "Dấu hiệu sinh tồn";
      case ObservationCategoryCode.imaging:
        return "Chẩn đoán hình ảnh";
      case ObservationCategoryCode.laboratory:
        return "Xét nghiệm labo";
      case ObservationCategoryCode.procedure:
        return "Thủ thuật";
      case ObservationCategoryCode.survey:
        return "Khảo sát / bảng hỏi";
      case ObservationCategoryCode.exam:
        return "Khám lâm sàng";
      case ObservationCategoryCode.therapy:
        return "Điều trị / liệu pháp";
      case ObservationCategoryCode.activity:
        return "Hoạt động bệnh nhân";
      case ObservationCategoryCode.unknow:
        return "Không có thông tin";
    }
  }

  /// Convert enum → FHIR code (string)
  String toCode() {
    switch (this) {
      case ObservationCategoryCode.socialHistory:
        return 'social-history';
      case ObservationCategoryCode.vitalSigns:
        return 'vital-signs';
      case ObservationCategoryCode.imaging:
        return 'imaging';
      case ObservationCategoryCode.laboratory:
        return 'laboratory';
      case ObservationCategoryCode.procedure:
        return 'procedure';
      case ObservationCategoryCode.survey:
        return 'survey';
      case ObservationCategoryCode.exam:
        return 'exam';
      case ObservationCategoryCode.therapy:
        return 'therapy';
      case ObservationCategoryCode.activity:
        return 'activity';
      case ObservationCategoryCode.unknow:
        return 'unknow';
    }
  }

  /// Convert FHIR code (string) → enum
  static ObservationCategoryCode fromCode(String code) {
    switch (code) {
      case 'social-history':
        return ObservationCategoryCode.socialHistory;
      case 'vital-signs':
        return ObservationCategoryCode.vitalSigns;
      case 'imaging':
        return ObservationCategoryCode.imaging;
      case 'laboratory':
        return ObservationCategoryCode.laboratory;
      case 'procedure':
        return ObservationCategoryCode.procedure;
      case 'survey':
        return ObservationCategoryCode.survey;
      case 'exam':
        return ObservationCategoryCode.exam;
      case 'therapy':
        return ObservationCategoryCode.therapy;
      case 'activity':
        return ObservationCategoryCode.activity;
      default:
        return ObservationCategoryCode.unknow;
    }
  }

}
