import 'package:inter_hospital_app/fakedata/hospital.dart';
import 'package:inter_hospital_app/features/create_code/data/models/hospital_api_model.dart';

abstract class HospitalRemoteDataSource {
  Future<List<HospitalApiModel>> getAllHospital();

  Future<List<HospitalApiModel>> getAllHospitalNewest(lastId);
}

class HospitalRemoteDataSourceImpl implements HospitalRemoteDataSource {
  @override
  Future<List<HospitalApiModel>> getAllHospital() async {
    // await Future.delayed(const Duration(seconds: 2));
    return hospitalsFakeData.map((e) => HospitalApiModel.fromJson(e)).toList();
  }

  @override
  Future<List<HospitalApiModel>> getAllHospitalNewest(lastId) async {
    // await Future.delayed(const Duration(seconds: 2));
    return hospitalsFakeData.where((element) {
      final id = element["id"] as int? ?? 0;
      return id > lastId;
    }).map((e) => HospitalApiModel.fromJson(e)).toList();
  }

}