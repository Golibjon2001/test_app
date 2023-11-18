import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/core/singeltons/service_locator.dart';
import 'package:test_app/features/categori/data/repository_impl/catagorie_repository_impl.dart';
import 'package:test_app/features/categori/domain/usecase/categore_usecase.dart';
import 'package:test_app/features/categori/presentation/bloc/categories_bloc.dart';
import 'package:test_app/features/categori/presentation/pages/category_sort_page.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  late CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    _categoriesBloc = CategoriesBloc(categoriesUseCase: CategoriesUseCase(serviceLocator<CategoriesRepositoryImpl>()))
      ..add(CategoriesListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _categoriesBloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: scaffoldBackground,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state.status == FormzSubmissionStatus.inProgress) {
                return const Center(child:CupertinoActivityIndicator(),);
              } else if (state.status == FormzSubmissionStatus.success) {
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5 / 0.3,
                      crossAxisCount: 2, // 2 ta ustun chiqamiz
                      crossAxisSpacing: 10.0, // O'lchamlar orasidagi bo'sh joy
                      mainAxisSpacing: 10.0, // O'lchamlar ketma-ketlikda bo'sh joy
                    ),
                    itemCount: state.categoriesList!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>CategorySortPage(sort:state.categoriesList![index].toString(),)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              state.categoriesList![index].toString(),
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ),
                      );
                    });
              } else if (state.status == FormzSubmissionStatus.failure) {
                return const Center(
                  child: Text("Fail"),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
