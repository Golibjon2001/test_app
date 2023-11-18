import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:test_app/features/basket/data/models.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';

part 'basked_event.dart';

part 'basked_state.dart';

class BaskedBloc extends Bloc<BaskedEvent, BaskedState> {
  BaskedBloc() : super(const BaskedState()) {
    on<AddProductBasked>((event, emit) {
      emit(state.copyWith(status:FormzSubmissionStatus.inProgress));
      final updateCart = List<BasketModel>.from(state.productsEntity??[])..add(event.productsEntity);
      emit(state.copyWith(status: FormzSubmissionStatus.success, productsEntity: updateCart));
    });
    on<RemoveProductBasked>((event, emit) {
      emit(state.copyWith(status:FormzSubmissionStatus.inProgress));
      final updateCart = List<BasketModel>.from(state.productsEntity??[])..remove(event.productsEntity);
      emit(state.copyWith(status: FormzSubmissionStatus.success, productsEntity: updateCart));
    });
  }
}
