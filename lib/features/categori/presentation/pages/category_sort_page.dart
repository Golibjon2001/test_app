import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/core/singeltons/service_locator.dart';
import 'package:test_app/features/basket/presentation/pages/basket_page.dart';
import 'package:test_app/features/home/data/repository_impl/product_repository_impl.dart';
import 'package:test_app/features/home/domain/entity/products_entity.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_bloc.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_event.dart';
import 'package:test_app/features/home/presentation/bloc/user_bloc/product_state.dart';
import 'package:test_app/features/home/presentation/widgets/products.dart';

import '../../../home/domain/usecase/product_usecase.dart';

class CategorySortPage extends StatefulWidget {
  final String sort;

  const CategorySortPage({Key? key, required this.sort}) : super(key: key);

  @override
  State<CategorySortPage> createState() => _CategorySortPageState();
}

class _CategorySortPageState extends State<CategorySortPage> {
  late ProductBloc userBloc;
  final List<dynamic> newList = [];

  @override
  void initState() {
    // newList.add(widget.sort);
    // print("NEW${}");
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
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: scaffoldBackground,
          elevation: 0,
          title: Text(
            widget.sort.toUpperCase(),
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
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: black,
            ),
          ),
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state.status == FormzSubmissionStatus.inProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status == FormzSubmissionStatus.success) {
              List<ProductsEntity> womenProducts =
                  state.productList!.where((product) => product.category == widget.sort).toList();
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.15,
                    crossAxisCount: 2, // 2 ta ustun chiqamiz
                    crossAxisSpacing: 10.0, // O'lchamlar orasidagi bo'sh joy
                    mainAxisSpacing: 10.0, // O'lchamlar ketma-ketlikda bo'sh joy
                  ),
                  itemCount: womenProducts.length,
                  itemBuilder: (context, index) {
                    return Products(productsEntity:womenProducts[index],);
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
