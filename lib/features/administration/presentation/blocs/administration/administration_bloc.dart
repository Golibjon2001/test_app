import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/features/administration/domain/entity/administration_entity.dart';
import 'package:test_app/features/administration/domain/usecase/administration_usecase.dart';

part 'administration_event.dart';
part 'administration_state.dart';

class AdministrationBloc extends Bloc<AdministrationEvent, AdministrationState> {
  final AdministrationUseCase administrationUseCase;
  AdministrationBloc({required this.administrationUseCase}) : super(const AdministrationState()) {
    on<AdministrationGetEvent>((event, emit) async{
      emit(state.copyWith(status:FormzSubmissionStatus.inProgress));
      try {
        final result = await administrationUseCase.call(NoParams());
        if (result.isRight) {
          emit(state.copyWith(administrationEntity:result.right,status:FormzSubmissionStatus.success));
        }
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }

    });
  }
}
