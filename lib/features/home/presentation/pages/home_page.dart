
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/core/singeltons/service_locator.dart';
import 'package:test_app/features/basket/data/models.dart';
import 'package:test_app/features/basket/presentation/pages/basket_page.dart';
import 'package:test_app/features/home/data/repository_impl/product_repository_impl.dart';
import 'package:test_app/features/home/domain/usecase/product_usecase.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_bloc.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_event.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_state.dart';
import 'package:test_app/features/home/presentation/widgets/products.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProductBloc userBloc;

  //late BaskedBloc baskedBloc;
  late List<BasketModel> basketList = [];

  @override
  void initState() {
    basketList;
    userBloc = ProductBloc(
      productUserUseCase: ProductUseCase(serviceLocator<ProductRepositoryImpl>()),
    )..add(ProductsEvent());
    super.initState();
  }

  @override
  void dispose() {
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: userBloc,
      child: Scaffold(
        backgroundColor: scaffoldBackground,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: scaffoldBackground,
          elevation: 0,
          title: Text(
            "Products",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BasketPage()));
              },
              icon: const Icon(
                Icons.shopping_cart,
                color: black,
              ),
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.status == FormzSubmissionStatus.inProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status == FormzSubmissionStatus.success) {
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.13,
                    crossAxisCount: 2, // 2 ta ustun chiqamiz
                    crossAxisSpacing: 10.0, // O'lchamlar orasidagi bo'sh joy
                    mainAxisSpacing: 10.0, // O'lchamlar ketma-ketlikda bo'sh joy
                  ),
                  itemCount: state.productList?.length ?? 0,
                  itemBuilder: (context, index) {
                    return state.productList!.isEmpty
                        ? const Center(child: Text("No Data"))
                        : Products(productsEntity:state.productList![index],);
                  });
            } else if (state.status == FormzSubmissionStatus.failure) {
              return const Center(child: Text("Fail"));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
