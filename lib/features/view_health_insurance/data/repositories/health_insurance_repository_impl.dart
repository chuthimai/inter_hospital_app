import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_local_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/data/datasources/health_insurance_remote_data_source.dart';
import 'package:inter_hospital_app/features/view_health_insurance/domain/entities/health_insurance.dart';
import 'package:inter_hospital_app/share/utils/app_logger.dart';
import '../../domain/repositories/health_insurance_repository.dart';

class HealthInsuranceRepositoryImpl implements HealthInsuranceRepository {
  final HealthInsuranceLocalDataSource _localDataSource;
  final HealthInsuranceRemoteDataSource _remoteDataSource;

  HealthInsuranceRepositoryImpl({
    required localDataSource,
    required remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  Future<HealthInsurance?> _getLocalHealthInsurance() async {
    try {
      final model = await _localDataSource.getLocalHealthInsurance();
      if (model != null && model.expiredDate.isAfter(DateTime.now())) {
        return model.toEntity();
      }
    } catch (e) {
      AppLogger().error("Local error: $e");
    }
    return null;
  }

  Future<HealthInsurance?> _getRemoteHealthInsurance(int userId) async {
    try {
      final remote = await _remoteDataSource.getRemoteHealthInsurance(userId);
      if (remote != null) {
        await _localDataSource.saveLocalHealthInsurance(remote);
        return remote.toEntity();
      }
    } catch (e) {
      AppLogger().error("Remote error: $e");
    }
    return null;
  }

  @override
  Future<HealthInsurance?> getHealthInsurance(int userId) async {
    final local = await _getLocalHealthInsurance();
    if (local != null) return local;

    return await _getRemoteHealthInsurance(userId);
  }
}
