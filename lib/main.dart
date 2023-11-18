import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/core/singeltons/service_locator.dart';
import 'package:test_app/features/basket/presentation/bloc/basked_bloc.dart';
import 'package:test_app/features/home/presentation/pages/navigationbar_page.dart';
import 'assets/thems/theme.dart';



void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('basket');
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:[
          BlocProvider(
              create: (context)=>BaskedBloc(),
          )
        ],
        child:MaterialApp(
          title: 'Test App',
          theme: AppTheme.theme(),
          home: const NavigationPage(),
        )
    );
  }
}
