import 'package:flutter_test/flutter_test.dart';
import 'package:inter_hospital_app/share/utils/id_formatter.dart';

void main() {
  group('IdFormatter', () {
    test('id ngắn hơn 12 ký tự thì được pad bằng 0 ở đầu', () {
      final result = IdFormatter.format(123);
      expect(result, '000000000123'); // 9 số 0 + "123"
      expect(result.length, 12);
    });

    test('id đúng 12 ký tự thì giữ nguyên', () {
      final result = IdFormatter.format(123456789012);
      expect(result, '123456789012');
      expect(result.length, 12);
    });

    test('id dài hơn 12 ký tự thì không cắt mà giữ nguyên', () {
      final result = IdFormatter.format(123456789012345);
      expect(result, '123456789012345');
      expect(result.length, greaterThan(12));
    });

    test('id = 0 thì thành 000000000000', () {
      final result = IdFormatter.format(0);
      expect(result, '000000000000');
      expect(result.length, 12);
    });
  });
}
