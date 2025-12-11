import 'package:inter_hospital_app/features/create_code/data/datasources/hospital_remote_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/datasources/hosptial_local_data_source.dart';
import 'package:inter_hospital_app/features/create_code/data/models/hospital_db_model.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/hospital.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';

import '../../domain/repositories/hosptital_repository.dart';

class HospitalRepositoryImpl implements HospitalRepository {
  final HospitalRemoteDataSource _remoteDataSource;
  final HospitalLocalDataSource _localDataSource;

  HospitalRepositoryImpl({
    required remoteDataSource,
    required localDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future<void> deleteLocalAllHospital() async {
    try {
      await _localDataSource.deleteLocalAllHospital();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
  }

  @override
  Future<List<Hospital>> getAllHospital() async {
    try {
      final hospitals = await _remoteDataSource.getAllHospital();
      await _localDataSource.saveHospitals(hospitals
          .map((e) => HospitalDbModel.fromEntity(e.toEntity()))
          .toList());
      return hospitals.map((e) => e.toEntity()).toList();
    } catch (e) {
      AppLogger().error("Local/Remote data: $e");
    }

    try {
      final allHospitals = await _localDataSource.getAllHospital();
      return allHospitals.map((e) => e.toEntity()).toList();
    } catch (e) {
      AppLogger().error("Local data: $e");
    }
    return [];
  }
}
