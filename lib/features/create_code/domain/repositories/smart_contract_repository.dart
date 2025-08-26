import 'package:inter_hospital_app/features/create_code/domain/entities/create_smart_contract_params.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/smart_contract.dart';

abstract class SmartContractRepository {
  Future<List<SmartContract>> getValidSmartContracts();
  Future<void> deleteExpiredSmartContracts();
  Future<void> deleteAllSmartContracts();
  Future<void> createSmartContract(CreateSmartContractParams smartContractParams);
}