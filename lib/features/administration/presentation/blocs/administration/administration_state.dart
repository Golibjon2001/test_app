part of 'administration_bloc.dart';

@immutable
class AdministrationState extends Equatable {
  final FormzSubmissionStatus? status;
  final List<AdministrationEntity>? administrationEntity;

  const AdministrationState({this.status, this.administrationEntity});

  AdministrationState copyWith({
    final FormzSubmissionStatus? status,
    final List<AdministrationEntity>? administrationEntity,
  }) =>
      AdministrationState(
        status: status ?? this.status,
        administrationEntity: administrationEntity ?? this.administrationEntity,
      );

  @override
  List<Object?> get props => [status, administrationEntity];
}
