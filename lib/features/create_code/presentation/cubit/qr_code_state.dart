import 'package:inter_hospital_app/features/create_code/domain/entities/smart_contract.dart';

abstract class QrCodeState {}

class QrCodeInitial implements QrCodeState {}

class QrCodeLoading implements QrCodeState {}

class QrCodeCreateSuccess implements QrCodeState {}

class QrCodeCreateFailure implements QrCodeState {
  final String message;

  QrCodeCreateFailure(String message)
      : message = message.replaceFirst("Exception: ", "");
}

class QrCodeLoadingListSuccess implements QrCodeState {
  final List<SmartContract> smartContracts;
  QrCodeLoadingListSuccess(this.smartContracts);
}
