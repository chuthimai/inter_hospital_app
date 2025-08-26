import 'package:inter_hospital_app/fakedata/hospital.dart';
import 'package:inter_hospital_app/fakedata/smart_contract.dart';
import 'package:inter_hospital_app/features/create_code/data/models/create_smart_contract_params_request.dart';
import 'package:inter_hospital_app/features/create_code/data/models/smart_contract_api_model.dart';

abstract class SmartContractRemoteDataSource {
  Future<List<SmartContractApiModel>> getSmartContractValid();

  Future<SmartContractApiModel> createSmartContract(
      CreateSmartContractParamsRequest contractParams);
}

class SmartContractRemoteDataSourceImpl
    implements SmartContractRemoteDataSource {
  @override
  Future<SmartContractApiModel> createSmartContract(
      CreateSmartContractParamsRequest contractParams) async {
    // await Future.delayed(const Duration(seconds: 1));
    final json = {
      "id": smartContractsFakeData.length,
      "key": "dsjnfjijifjkemd9849u3nrn2c9i02orefbu3ur39e2r32re2i93i2deimx9r3",
      "permission": "read",
      "validFrom": contractParams.validFrom.toString(),
      "validTo": contractParams.validTo.toString(),
      "subject": hospitalsFakeData.firstWhere((element) {
        final id = element["id"] as int? ?? 0;
        return id == contractParams.subjectId;
      })
    };
    smartContractsFakeData.add(json);
    return SmartContractApiModel.fromJson(json);
  }

  @override
  Future<List<SmartContractApiModel>> getSmartContractValid() async {
    // await Future.delayed(const Duration(seconds: 1));
    return smartContractsFakeData
        .map((e) => SmartContractApiModel.fromJson(e))
        .where((element) {
      return element.validTo.isAfter(DateTime.now());
    }).toList();
  }
}
