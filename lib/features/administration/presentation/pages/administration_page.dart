import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:test_app/assets/colors/colors.dart';
import 'package:test_app/core/singeltons/service_locator.dart';
import 'package:test_app/features/administration/data/repository_impl/administration_repository_impl.dart';
import 'package:test_app/features/administration/domain/usecase/administration_usecase.dart';
import 'package:test_app/features/administration/presentation/blocs/administration/administration_bloc.dart';
import 'package:test_app/features/administration/presentation/widgets/administration_widget.dart';
import 'package:test_app/features/basket/presentation/pages/basket_page.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({Key? key}) : super(key: key);

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  late AdministrationBloc _administrationBloc;

  @override
  void initState() {
    _administrationBloc =
        AdministrationBloc(administrationUseCase: AdministrationUseCase(serviceLocator<AdministrationRepositoryImpl>()))
          ..add(AdministrationGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _administrationBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldBackground,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Administrations",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(child: BlocBuilder<AdministrationBloc, AdministrationState>(
          builder: (context, state) {
            if (state.status == FormzSubmissionStatus.inProgress) {
              return const Center(child:CupertinoActivityIndicator(),);
            } else if (state.status == FormzSubmissionStatus.success) {
              return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: state.administrationEntity!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>const BasketPage()));
                      },
                        child: AdministrationWidget(administrationEntity:state.administrationEntity![index],)
                    );
                  });
            } else if (state.status == FormzSubmissionStatus.failure) {
              return const Center(
                child: Text("Fail"),
              );
            }
            return const SizedBox();
          },
        )),
      ),
    );
  }
}
