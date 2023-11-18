

import 'package:bloc/bloc.dart';

import 'package:formz/formz.dart';
import 'package:test_app/core/use_case/use_case.dart';
import 'package:test_app/features/home/domain/usecase/product_usecase.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_event.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_state.dart';



class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductUseCase productUserUseCase;

  ProductBloc({required this.productUserUseCase}) : super(const ProductState()) {
    on<ProductsEvent>((event, emit) async {
      emit(state.copyWith(status:FormzSubmissionStatus.inProgress));
      try {
        final result = await productUserUseCase.call(NoParams());
        if (result.isRight) {
          emit(state.copyWith(productList: result.right, status: FormzSubmissionStatus.success));
        }
      } catch (e) {
        print(e.toString());
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    });
  }
}
