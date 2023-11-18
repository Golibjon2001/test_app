

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/features/categori/domain/usecase/categore_usecase.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesUseCase categoriesUseCase;
  CategoriesBloc({required this.categoriesUseCase}) : super(const CategoriesState()) {
    on<CategoriesListEvent>((event, emit) async{
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try{
      final result=await categoriesUseCase.call(NoParams());
      if(result.isRight){
        emit(state.copyWith(categoriesList: result.right, status: FormzSubmissionStatus.success));
      }
    }catch (e) {
      print(e.toString());
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
    });
  }
}
