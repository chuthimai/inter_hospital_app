import 'package:isar/isar.dart';
import '../../domain/entities/smart_contract.dart';
import 'hospital_db_model.dart';

part 'smart_contract_db_model.g.dart';

@collection
class SmartContractDbModel {
  Id id;
  late String key;
  late String permission;
  late DateTime validFrom;
  @Index(composite: [CompositeIndex("validFrom")])
  late DateTime validTo;
  @Index()
  final subject = IsarLink<HospitalDbModel>();

  SmartContractDbModel({
    required this.id,
    required this.key,
    required this.permission,
    required this.validFrom,
    required this.validTo,
  });

  Future<SmartContract> toEntity() async {
    await subject.load();
    return SmartContract(
      id: id,
      key: key,
      permission: permission,
      validFrom: validFrom,
      validTo: validTo,
      subject: subject.value!.toEntity(),
    );
  }

  factory SmartContractDbModel.fromEntity(SmartContract smartContract) {
    final hospital = HospitalDbModel.fromEntity(smartContract.subject);
    final contract = SmartContractDbModel(
      id: smartContract.id,
      key: smartContract.key,
      permission: smartContract.permission,
      validFrom: smartContract.validFrom,
      validTo: smartContract.validTo,
    );

    contract.subject.value = hospital;
    return contract;
  }
}
