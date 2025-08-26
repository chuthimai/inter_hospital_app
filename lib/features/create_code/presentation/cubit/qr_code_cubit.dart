import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inter_hospital_app/features/create_code/domain/entities/create_smart_contract_params.dart';
import 'package:inter_hospital_app/features/create_code/domain/repositories/smart_contract_repository.dart';
import 'package:inter_hospital_app/features/create_code/presentation/cubit/qr_code_state.dart';

class QrCodeCubit extends Cubit<QrCodeState> {
  final SmartContractRepository repo;

  QrCodeCubit(this.repo) : super(QrCodeInitial());

  Future<void> createQrCode(CreateSmartContractParams params) async {
    emit(QrCodeLoading());
    try {
      // TODO: delete after test
      // await repo.deleteAllSmartContracts();
      await repo.createSmartContract(params);
      emit(QrCodeCreateSuccess());
    } catch (e) {
      emit(QrCodeCreateFailure(e.toString()));
    }
    emit(QrCodeInitial());
  }

  Future<void> getAllValidQrCodes() async {
    emit(QrCodeLoading());
    final qrCodes = await repo.getValidSmartContracts();
    emit(QrCodeLoadingListSuccess(qrCodes));
  }
}