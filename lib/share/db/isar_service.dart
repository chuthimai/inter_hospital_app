import 'package:inter_hospital_app/features/notification/data/models/notification_db_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/create_code/data/models/hospital_db_model.dart';
import '../../features/create_code/data/models/smart_contract_db_model.dart';

class IsarService {
  static Isar? _isar;

  static Future<Isar> get instance async {
    if (_isar != null) return _isar!;
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        HospitalDbModelSchema,
        SmartContractDbModelSchema,
        NotificationDbModelSchema,
      ],
      directory: dir.path,
      inspector: true,
    );
    return _isar!;
  }
}
