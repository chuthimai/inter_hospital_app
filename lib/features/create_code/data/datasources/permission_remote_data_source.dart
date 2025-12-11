import 'package:inter_hospital_app/share/constants/path_api.dart';
import 'package:inter_hospital_app/share/dio/remote_service.dart';

import '../../domain/entities/hospital.dart';
import '../models/permission_api_model.dart';

abstract class PermissionRemoteDataSource {
  Future<PermissionApiModel> createPermission(Hospital hospital);
}

class PermissionRemoteDataSourceImpl implements PermissionRemoteDataSource {
  @override
  Future<PermissionApiModel> createPermission(Hospital hospital) async {
    try {
      final remote = RemoteService();
      final response =
          await remote.post(PathApi.createPermission, data: {
            "hospitalIdentifier": hospital.id,
          });

      return PermissionApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

}