import 'package:inter_hospital_app/fakedata/hospital.dart';
import 'package:inter_hospital_app/features/create_code/data/models/hospital_api_model.dart';
import 'package:inter_hospital_app/share/constants/path_api.dart';
import 'package:inter_hospital_app/share/dio/remote_service.dart';
import 'package:inter_hospital_app/share/utils/app_exception/api_error_handler.dart';
import 'package:inter_hospital_app/share/utils/app_exception/api_exception.dart';

abstract class HospitalRemoteDataSource {
  Future<List<HospitalApiModel>> getAllHospital();

  Future<List<HospitalApiModel>> getAllHospitalNewest(lastId);
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  @override
  Future<List<HospitalApiModel>> getAllHospital() async {
    try {
      final remote = RemoteService();
      final response = await remote.get(PathApi.getAllHospital);
      final List<dynamic> jsonList = response.data as List<dynamic>;
      return jsonList
          .map((json) => HospitalApiModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      final error = ApiErrorHandler.handle(e);
      throw error;
    }
  }

  @override
  Future<List<HospitalApiModel>> getAllHospitalNewest(lastId) {
    // TODO: implement getAllHospitalNewest
    throw UnimplementedError();
  }
}