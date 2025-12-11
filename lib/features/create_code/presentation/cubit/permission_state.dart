import '../../domain/entities/permission.dart';

abstract class PermissionState {}

class PermissionInitial implements PermissionState {}

class PermissionLoading implements PermissionState {}

class PermissionCreatedSuccess implements PermissionState {}

class PermissionCreatedFailure implements PermissionState {
  final String message;
  PermissionCreatedFailure(String message)
      : message = message.replaceFirst("Exception: ", "");
}

class PermissionGetAllSuccess implements PermissionState {
  final List<Permission> permissions;
  PermissionGetAllSuccess(this.permissions);
}
