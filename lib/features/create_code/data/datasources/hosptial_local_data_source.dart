import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:inter_hospital_app/share/db/isar_service.dart';
import 'package:isar/isar.dart';

abstract class HospitalLocalDataSource {
  Future<List<HospitalDbModel>> getAllHospital();
  Future<void> saveHospital(HospitalDbModel hospital);
  Future<void> saveHospitals(List<HospitalDbModel> hospitals);
  Future<void> deleteLocalAllHospital();
  Future<int?> getLastId();
}

class HospitalLocalDataSourceImpl implements HospitalLocalDataSource {
  Future<Isar> get _isar async => await IsarService.instance;

  @override
  Future<void> deleteLocalAllHospital() async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.hospitalDbModels.clear(); // xoá toàn bộ bảng
    });
  }

  @override
  Future<List<HospitalDbModel>> getAllHospital() async {
    final isar = await _isar;
    return await isar.hospitalDbModels.where().findAll();
  }

  @override
  Future<void> saveHospital(HospitalDbModel hospital) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.hospitalDbModels.put(hospital);
    });
  }

  @override
  Future<void> saveHospitals(List<HospitalDbModel> hospitals) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.hospitalDbModels.putAll(hospitals);
    });
  }

  @override
  Future<int> getLastId() async {
    final isar = await _isar;
    final last = await isar.hospitalDbModels.where(sort: Sort.desc).findFirst();
    return last?.id ?? 0;
  }

}