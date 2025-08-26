class CreateSmartContractParams {
  final String permission;
  final DateTime validFrom;
  final DateTime validTo;
  final int subjectId;
  final int grantedBy;

  CreateSmartContractParams({
    required this.permission,
    required this.validFrom,
    required this.validTo,
    required this.subjectId,
    required this.grantedBy,
  });
}
