import 'package:education_app/core/enums/update_user.dart';
import 'package:education_app/core/usecases/usecases.dart';
import 'package:education_app/core/utils/typdefs.dart';
import 'package:education_app/src/auth/domain/repos/auth_repo.dart';
import 'package:equatable/equatable.dart';

class UpdateUser extends UsecaseWithParams<void, UpdateUserParams> {
  UpdateUser(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserParams params) => _repo.updateUser(
        action: params.action,
        userData: params.userData,
      );
}

class UpdateUserParams extends Equatable {
  const UpdateUserParams({
    required this.action,
    this.userData,
  });

  const UpdateUserParams.empty()
      : this(
          action: UpdateUserAction.displayName,
          userData: '',
        );
  final dynamic userData;
  final UpdateUserAction action;

  @override
  List<Object?> get props => [action, userData];
}
