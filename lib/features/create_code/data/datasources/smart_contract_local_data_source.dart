import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:inter_hospital_app/features/create_code/data/models/smart_contract_db_model.dart';
import 'package:inter_hospital_app/share/db/isar_service.dart';
import 'package:isar/isar.dart';

abstract class SmartContractLocalDataSource {
  Future<List<SmartContractDbModel>> getValidSmartContracts();

  Future<void> deleteExpiredSmartContracts();

  Future<void> deleteAllSmartContracts();

  Future<void> saveSmartContract(SmartContractDbModel smartContract);

  Future<void> saveSmartContracts(List<SmartContractDbModel> smartContracts);

  Future<SmartContractDbModel?> getValidSmartContractsWithHospital({
    required int hospitalId,
    required DateTime startTime,
  });
}

class SmartContractLocalDataSourceImpl implements SmartContractLocalDataSource {
  Future<Isar> get _isar async => await IsarService.instance;

  @override
  Future<void> deleteExpiredSmartContracts() async {
    final isar = await _isar;
    final now = DateTime.now();

    await isar.writeTxn(() async {
      await isar.smartContractDbModels
          .filter()
          .validToLessThan(now)
          .deleteAll();
    });
  }

  @override
  Future<List<SmartContractDbModel>> getValidSmartContracts() async {
    final isar = await _isar;
    final now = DateTime.now();

    final contracts = await isar.smartContractDbModels
        .filter()
        .validFromLessThan(now)
        .findAll();

    return contracts;
  }

  @override
  Future<void> saveSmartContract(SmartContractDbModel smartContract) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.smartContractDbModels.put(smartContract);
      await smartContract.subject.save();
    });
  }

  @override
  Future<void> saveSmartContracts(List<SmartContractDbModel> smartContracts) async {
    final isar = await _isar;
    await isar.writeTxn(() async {
      await isar.smartContractDbModels.putAll(smartContracts);

      for (var contract in smartContracts) {
        await contract.subject.save();
      }
    });
  }

  @override
  Future<SmartContractDbModel?> getValidSmartContractsWithHospital({
    required int hospitalId,
    required DateTime startTime,
  }) async {
    final isar = await _isar;

    final contract = await isar.smartContractDbModels
        .filter()
        .validFromLessThan(startTime)
        .and()
        .validToGreaterThan(startTime)
        .and()
        .subject((q) => q.idEqualTo(hospitalId))
        .findFirst();

    if (contract != null) {
      await contract.subject.load();

      if (contract.subject.value?.id == hospitalId) {
        return contract;
      }
    }
    return null;
  }

  @override
  Future<void> deleteAllSmartContracts() async {
    final isar = await _isar;

    await isar.writeTxn(() async {
      await isar.smartContractDbModels.clear();
    });
  }
}
