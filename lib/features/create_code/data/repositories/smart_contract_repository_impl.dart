import 'package:inter_hospital_app/features/create_code/data/datasources/smart_contract_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/smart_contract_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/models/create_smart_contract_params_request.dart';
import 'package:inter_hospital_app/features/create_code/data/models/smart_contract_db_model.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/create_smart_contract_params.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/smart_contract.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/repositories/smart_contract_repository.dart';

class SmartContractRepositoryImpl implements SmartContractRepository {
  final SmartContractLocalDataSource _localDataSource;
  final SmartContractRemoteDataSource _remoteDataSource;

  SmartContractRepositoryImpl({
    required localDataSource,
    required remoteDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<void> createSmartContract(
      CreateSmartContractParams smartContractParams) async {
    try {
      await _checkValidSmartContract(smartContractParams);
    } catch(e) {
      AppLogger().error("Local data: $e");
      throw Exception("Mã tạo trước đó vẫn còn hiệu lực");
    }

    try {
      final newContractApi = await _remoteDataSource.createSmartContract(
        CreateSmartContractParamsRequest.fromParams(smartContractParams),
      );
      await _localDataSource.saveSmartContract(
          SmartContractDbModel.fromEntity(newContractApi.toEntity()));
    } catch (e) {
      AppLogger().error("Remote data: $e");
      throw Exception("Tạo mã thất bại");
    }
  }

  Future<void> _checkValidSmartContract(
      CreateSmartContractParams smartContractParams) async {
    await getValidSmartContracts();
    final smartContractValid =
    await _localDataSource.getValidSmartContractsWithHospital(
      hospitalId: smartContractParams.subjectId,
      startTime: smartContractParams.validFrom,
    );
    if (smartContractValid != null) {
      throw Exception("Mã tạo trước đó vẫn còn hiệu lực");
    }
  }

  @override
  Future<void> deleteExpiredSmartContracts() async {
    try {
      await _localDataSource.deleteExpiredSmartContracts();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
  }

  @override
  Future<void> deleteAllSmartContracts() async {
    try {
      await _localDataSource.deleteAllSmartContracts();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
  }

  @override
  Future<List<SmartContract>> getValidSmartContracts() async {
    try {
      await deleteExpiredSmartContracts();
      final smartContracts = await _localDataSource.getValidSmartContracts();
      if (smartContracts.isNotEmpty) {
        return await Future.wait(smartContracts.map((e) => e.toEntity()).toList());
      }
      // Chỉ gọi remote khi mới cài app ko có data
      final remoteSmartContract =
          await _remoteDataSource.getSmartContractValid();
      return remoteSmartContract.map((e) => e.toEntity()).toList();
    } catch (e) {
      AppLogger().error("Local data: $e");
      return [];
    }
  }
}
